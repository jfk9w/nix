{pkgs, ...}: {
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

  networking = {
    computerName = "macnug";
    hostName = "macnug";
    localHostName = "macnug";
  };

  nix = {
    enable = true;
    gc = {
      automatic = true;
    };
    optimise = {
      automatic = true;
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    aldente
    syncthing-macos
  ];

  # Enable alternative shell support in nix-darwin.
  programs = {
    fish.enable = true;
  };

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

  nix-homebrew = {
    enable = true;
    user = "iakulkov";
    mutableTaps = true;
  };

  homebrew = {
    enable = true;
    global.autoUpdate = false;
    onActivation = {
      autoUpdate = false;
      cleanup = "uninstall";
      upgrade = false;
    };
    taps = [
      "tigase/tigase"
    ];
    casks = [
      "android-platform-tools"
      "beagleim"
      "betterdisplay"
      "dbeaver-community"
      # "goland"
      "jellyfin-media-player"
      "mattermost"
      "shadowsocksx-ng"
      "soduto"
      "spotify"
      "tunnelblick"
      "whatsapp"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.iakulkov = {
      imports = [../home-manager/macnug.nix];
    };
  };
}
