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
      { plugin = catppuccin-nvim; type = "lua"; config = builtins.readFile ./neovim/plugins/catppuccin-nvim.lua; }
      { plugin = nvim-colorizer-lua; type = "lua"; config = builtins.readFile ./neovim/plugins/nvim-colorizer-lua.lua; }
      { plugin = telescope-nvim; type = "lua"; config = builtins.readFile ./neovim/plugins/telescope-nvim.lua; }
      telescope-fzf-native-nvim
      { plugin = nvim-lspconfig; type = "lua"; config = builtins.readFile ./neovim/plugins/nvim-lspconfig.lua; }
    ];
    extraLuaConfig = builtins.readFile ./neovim/init.lua;
  };
}