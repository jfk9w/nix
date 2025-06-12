{
  pkgs,
  user,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Enable Touch ID with sudo.
  security.pam.services.sudo_local.touchIdAuth = true;

  users.users = {
    "${user}" = {
      home = "/Users/${user}";
      shell = pkgs.fish;
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users."${user}" = {...}: {
      home.stateVersion = "25.05";
      programs = {
        home-manager.enable = true;
        fish.enable = true;
      };
    };
  };
}
