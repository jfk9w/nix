{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # Lua
      lua-language-server
      stylua
      # Nix
      nixd
      alejandra
    ];
    plugins = with pkgs.vimPlugins; [
      which-key-nvim
      nvim-lspconfig
      fidget-nvim
      blink-cmp
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/catppuccin.lua;
      }
    ];
    extraLuaConfig = builtins.readFile ./neovim/init.lua;
  };
}