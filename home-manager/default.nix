{...}: {
  imports = [
    ./kitty.nix
    ./zoxide.nix
    ./aerospace.nix
    ./nixvim.nix
  ];
  programs = {
    home-manager.enable = true;
    fish.enable = true;
  };
}
