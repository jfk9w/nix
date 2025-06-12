{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    font.name = "Mononoki Nerd Font Mono";
    font.package = pkgs.nerd-fonts.mononoki;
    font.size = 15;
    themeFile = "relaxed_afterglow";
    shellIntegration = {
      enableFishIntegration = true;
    };
    settings = {
      shell = "${pkgs.fish}/bin/fish";
      background_opacity = 0.9;
      hide_window_decorations = "titlebar-only";
      window_padding_width = 4;
      macos_quit_when_last_window_closed = "yes";
    };
  };
}
