{user, ...}: {
  home-manager.users."${user}" = {...}: {
    imports = [
      ./programs/kitty.nix
      ./programs/zoxide.nix
      ./programs/aerospace.nix
      ./programs/neovim.nix
      ./programs/golang.nix
    ];
  };
}
