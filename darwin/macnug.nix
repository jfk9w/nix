{
  pkgs,
  homebrew-core,
  homebrew-cask,
  ...
}: {
  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  system = {
    stateVersion = 6;
    primaryUser = "iakulkov";
    primaryUserHome = "/Users/iakulkov";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    aldente
  ];

  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Enable Touch ID with sudo.
  security.pam.services.sudo_local.touchIdAuth = true;

  users.users = {
    iakulkov = {
      home = "/Users/iakulkov";
      shell = pkgs.fish;
    };
  };

  # nix-homebrew = {
  #   enable = true;
  #   user = "iakulkov";
  #   taps = {
  #     "homebrew/homebrew-core" = homebrew-core;
  #     "homebrew/homebrew-cask" = homebrew-cask;
  #   };
  #   mutableTaps = false;
  # };
  #
  # homebrew = {
  #   enable = true;
  #   casks = [
  #     "android-platform-tools"
  #     "beagleim"
  #     "betterdisplay"
  #     "dbeaver-community"
  #     "firefox"
  #     "goland"
  #     "google-chrome"
  #     "jellyfin-media-player"
  #     "keepassxc"
  #     "mattermost"
  #     "moonlight"
  #     "shadowsocksx-ng"
  #     "slack"
  #     "soduto"
  #     "spotify"
  #     "syncthing"
  #     "telegram-desktop"
  #     "tunnelblick"
  #     "whatsapp"
  #   ];
  # };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.iakulkov = {
      imports = [../home-manager/macnug.nix];
    };
  };
}
