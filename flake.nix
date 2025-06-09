{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    configuration = {
      config,
      pkgs,
      ...
    }: {
      nixpkgs.config = {
        allowUnfree = true;
        allowBroken = true;
      };

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        nerd-fonts.mononoki
        fzf
        neovim
        alejandra
        nixd
        git
        git-lfs
        keepassxc
        go
        golangci-lint
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Enable Touch ID with sudo.
      security.pam.services.sudo_local.touchIdAuth = true;

      users.users = {
        iakulkov = {
          home = "/Users/iakulkov";
          shell = pkgs.fish;
        };
      };
    };
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macnug
    darwinConfigurations = {
      macnug = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              users.iakulkov = {...}:
                with inputs; {
                  imports = [./home-manager];
                  home.stateVersion = "25.05";
                };
            };
          }
        ];
      };
    };
  };
}
