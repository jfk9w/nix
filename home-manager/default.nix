{...}: {
  imports = [
    ./kitty.nix
    ./zoxide.nix
    ./aerospace.nix
    ./neovim.nix
    ./golang.nix
  ];
  programs = {
    home-manager.enable = true;
    fish.enable = true;
  };
}
