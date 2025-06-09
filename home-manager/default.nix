{...}: {
  imports = [
    ./kitty.nix
    ./zoxide.nix
    ./aerospace.nix
  ];
  programs = {
    home-manager.enable = true;
    fish.enable = true;
  };
}
