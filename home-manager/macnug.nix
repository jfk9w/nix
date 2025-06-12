{...}: {
  home.stateVersion = "25.05";

  programs = {
    home-manager.enable = true;
    fish.enable = true;
  };

  imports = [
    ./programs/kitty.nix
    ./programs/zoxide.nix
    ./programs/aerospace.nix
    ./programs/neovim.nix
    ./programs/golang.nix
  ];
}
