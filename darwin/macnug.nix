{
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
  environment.systemPackages = [
    pkgs.nerd-fonts.mononoki
    pkgs.fzf
    pkgs.neovim
    pkgs.alejandra
    pkgs.nixd
    pkgs.git
    pkgs.git-lfs
    pkgs.keepassxc
    pkgs.go
    pkgs.golangci-lint
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
}
