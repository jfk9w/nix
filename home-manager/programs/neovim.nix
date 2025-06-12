{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # Search
      fzf
      ripgrep
      # Git
      lazygit
      # Lua
      lua-language-server
      stylua
      # Nix
      nixd
      alejandra
      # Go
      gopls
    ];
    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      nvim-nio
      {
        plugin = lazygit-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/lazygit-nvim.lua;
      }
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/catppuccin-nvim.lua;
      }
      {
        plugin = todo-comments-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/todo-comments-nvim.lua;
      }
      {
        plugin = mini-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/mini-nvim.lua;
      }
      {
        plugin = neo-tree-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/neo-tree-nvim.lua;
      }
      {
        plugin = nvim-colorizer-lua;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/nvim-colorizer-lua.lua;
      }
      {
        plugin = guess-indent-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/guess-indent-nvim.lua;
      }
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/gitsigns-nvim.lua;
      }
      {
        plugin = which-key-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/which-key-nvim.lua;
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/telescope-nvim.lua;
      }
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/nvim-lspconfig.lua;
      }
      fidget-nvim
      {
        plugin = friendly-snippets;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/friendly-snippets.lua;
      }
      luasnip
      {
        plugin = blink-cmp;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/blink-cmp.lua;
      }
      {
        plugin = nvim-treesitter;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/nvim-treesitter.lua;
      }
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.go
      nvim-treesitter-parsers.gotmpl
      nvim-treesitter-parsers.gowork
      nvim-treesitter-parsers.gomod
      nvim-treesitter-parsers.gosum
      {
        plugin = conform-nvim;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/conform-nvim.lua;
      }
      {
        plugin = neotest;
        type = "lua";
        config = builtins.readFile ./neovim/plugins/neotest.lua;
      }
      neotest-golang
    ];
    extraLuaConfig = builtins.readFile ./neovim/init.lua;
  };
}
