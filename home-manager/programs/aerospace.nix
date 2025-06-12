{pkgs, ...}: {
  programs.aerospace = {
    enable = true;
    userSettings = {
      start-at-login = true;
      after-startup-command = [
        "exec-and-forget borders active_color=0xffa062fc inactive_color=0xff524850 width=5.0 style=round"
      ];
      gaps = {
        inner.horizontal = 2;
        inner.vertical = 2;
        outer.left = 2;
        outer.bottom = 2;
        outer.top = 2;
        outer.right = 2;
      };
      mode.main.binding = {
        # Move focus
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        # Move window
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";
        # Move to workspace
        alt-shift-1 = "move-node-to-workspace 1 --focus-follows-window";
        alt-shift-2 = "move-node-to-workspace 2 --focus-follows-window";
        alt-shift-3 = "move-node-to-workspace 3 --focus-follows-window";
        alt-shift-4 = "move-node-to-workspace 4 --focus-follows-window";
        alt-shift-5 = "move-node-to-workspace 5 --focus-follows-window";
        alt-shift-6 = "move-node-to-workspace 6 --focus-follows-window";
        alt-shift-7 = "move-node-to-workspace 7 --focus-follows-window";
        alt-shift-8 = "move-node-to-workspace 8 --focus-follows-window";
        alt-shift-9 = "move-node-to-workspace 9 --focus-follows-window";
        # Switch to workspace
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        # Resize window
        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";
        # Close window
        alt-c = "close";
        # Kitty
        alt-q = "exec-and-forget ${pkgs.kitty}/bin/kitty ~";
      };
      on-window-detected = [
        {
          check-further-callbacks = false;
          "if" = {
            app-id = "org.keepassxc.keepassxc";
          };
          run = ["layout floating"];
        }
      ];
    };
  };
}
