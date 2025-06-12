{pkgs, ...}: {
  home = {
    stateVersion = "25.05";
    packages = with pkgs; [
      moonlight-qt
      slack
      telegram-desktop
    ];
  };

  programs = {
    home-manager.enable = true;
    fish.enable = true;
    direnv.enable = true;
    firefox.enable = true;
    btop.enable = true;
    chromium = {
      enable = true;
      package = pkgs.google-chrome;
    };
    keepassxc.enable = true;
  };

  services = {
    jankyborders.enable = true;
  };

  imports = [
    ./programs/kitty.nix
    ./programs/zoxide.nix
    ./programs/aerospace.nix
    ./programs/neovim.nix
    ./programs/golang.nix
  ];
}
