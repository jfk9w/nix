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
      { plugin = guess-indent-nvim; type = "lua"; config = builtins.readFile ./neovim/plugins/guess-indent-nvim.lua; }
      { plugin = gitsigns-nvim; type = "lua"; config = builtins.readFile ./neovim/plugins/gitsigns-nvim.lua; }
      { plugin = which-key-nvim; type = "lua"; config = builtins.readFile ./neovim/plugins/which-key-nvim.lua; }
      { plugin = telescope-nvim; type = "lua"; config = builtins.readFile ./neovim/plugins/telescope-nvim.lua; }
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      { plugin = nvim-lspconfig; type = "lua"; config = builtins.readFile ./neovim/plugins/nvim-lspconfig.lua; }
      fidget-nvim
      blink-cmp
      { plugin = conform-nvim; type = "lua"; config = builtins.readFile ./neovim/plugins/conform-nvim.lua; }
    ];
    extraLuaConfig = builtins.readFile ./neovim/init.lua;
  };
}