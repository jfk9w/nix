{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      alejandra
    ];
    plugins = with pkgs.vimPlugins; [
      which-key-nvim
      nvim-lspconfig
      fidget-nvim
      blink-cmp
      {
        plugin = solarized.nvim;
        type = "lua";
        config = builtins.readFile ./neovim/solarized.lua;
      }
    ];
    extraLuaConfig = builtins.readFile ./neovim/init.lua;
  };
}