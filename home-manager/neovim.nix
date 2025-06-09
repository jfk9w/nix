{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      alejandra
    ];
    plugins = [
      blink.cmp
    ];
  };
}