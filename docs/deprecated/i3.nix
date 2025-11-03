{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xclip
    xcolor
    ffcast
    slop
  ];

  xsession.windowManager.i3 =
    let
      mod = "Mod4";
      mainDesktop = "DP-0";
      secondDesktop = "HDMI-1";
    in
    {
      enable = true;
      config = {
        modifier = mod;
        window = {
          hideEdgeBorders = "both";
          titlebar = false;
          border = 0;
        };
        floating = {
          titlebar = false;
          border = 0;
          criteria = [
            {
              class = "^AmneziaVPN$";
            }
            {
              class = "^pwvucontrol$";
            }
          ];
        };
        bars = [
          {
            mode = "invisible";
          }
        ];
        keybindings = {
          "${mod}+q" = "kill";
          "${mod}+space" = "exec --no-startup-id rofi -show combi";

          "XF86AudioPrev" = "exec --no-startup-id playerctl previous";
          "XF86AudioLowerVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_SINK@ .05-";
          "XF86AudioRaiseVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_SINK@ .05+";
          "XF86AudioNext" = "exec --no-startup-id playerctl next";
          "XF86AudioPlay" = "exec --no-startup-id playerctl play-pause";

          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";
          "${mod}+a" = "workspace a";
          "${mod}+b" = "workspace b";
          "${mod}+c" = "workspace c";
          "${mod}+d" = "workspace d";
          "${mod}+e" = "workspace e";
          "${mod}+f" = "workspace f";
          "${mod}+g" = "workspace g";
          "${mod}+i" = "workspace i";
          "${mod}+m" = "workspace m";
          "${mod}+n" = "workspace n";
          "${mod}+o" = "workspace o";
          "${mod}+p" = "workspace p";
          "${mod}+r" = "workspace r";
          "${mod}+s" = "workspace s";
          "${mod}+t" = "workspace t";
          "${mod}+u" = "workspace u";
          "${mod}+v" = "workspace v";
          "${mod}+w" = "workspace w";
          "${mod}+x" = "workspace x";
          "${mod}+y" = "workspace y";
          "${mod}+z" = "workspace z";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";
          "${mod}+Shift+a" = "move container to workspace a";
          "${mod}+Shift+b" = "move container to workspace b";
          "${mod}+Shift+c" = "move container to workspace c";
          "${mod}+Shift+d" = "move container to workspace d";
          "${mod}+Shift+e" = "move container to workspace e";
          "${mod}+Shift+f" = "move container to workspace f";
          "${mod}+Shift+g" = "move container to workspace g";
          "${mod}+Shift+i" = "move container to workspace i";
          "${mod}+Shift+m" = "move container to workspace m";
          "${mod}+Shift+n" = "move container to workspace n";
          "${mod}+Shift+o" = "move container to workspace o";
          "${mod}+Shift+p" = "move container to workspace p";
          "${mod}+Shift+r" = "move container to workspace r";
          "${mod}+Shift+s" = "move container to workspace s";
          "${mod}+Shift+t" = "move container to workspace t";
          "${mod}+Shift+u" = "move container to workspace u";
          "${mod}+Shift+v" = "move container to workspace v";
          "${mod}+Shift+w" = "move container to workspace w";
          "${mod}+Shift+x" = "move container to workspace x";
          "${mod}+Shift+y" = "move container to workspace y";
          "${mod}+Shift+z" = "move container to workspace z";

          "${mod}+Shift+Tab" = "move workspace to output next";
        };
        workspaceOutputAssign = [
          {
            output = mainDesktop;
            workspace = "1";
          }
          {
            output = mainDesktop;
            workspace = "2";
          }
          {
            output = mainDesktop;
            workspace = "3";
          }
          {
            output = mainDesktop;
            workspace = "4";
          }
          {
            output = mainDesktop;
            workspace = "5";
          }
          {
            output = mainDesktop;
            workspace = "6";
          }
          {
            output = mainDesktop;
            workspace = "7";
          }
          {
            output = mainDesktop;
            workspace = "8";
          }
          {
            output = mainDesktop;
            workspace = "9";
          }
          {
            output = secondDesktop;
            workspace = "10";
          }
          {
            output = mainDesktop;
            workspace = "a";
          }
          {
            output = secondDesktop;
            workspace = "b";
          }
          {
            output = secondDesktop;
            workspace = "c";
          }
          {
            output = mainDesktop;
            workspace = "d";
          }
          {
            output = mainDesktop;
            workspace = "e";
          }
          {
            output = secondDesktop;
            workspace = "f";
          }
          {
            output = mainDesktop;
            workspace = "g";
          }
          {
            output = mainDesktop;
            workspace = "i";
          }
          {
            output = mainDesktop;
            workspace = "m";
          }
          {
            output = mainDesktop;
            workspace = "n";
          }
          {
            output = mainDesktop;
            workspace = "o";
          }
          {
            output = mainDesktop;
            workspace = "p";
          }
          {
            output = mainDesktop;
            workspace = "q";
          }
          {
            output = mainDesktop;
            workspace = "r";
          }
          {
            output = mainDesktop;
            workspace = "s";
          }
          {
            output = mainDesktop;
            workspace = "t";
          }
          {
            output = mainDesktop;
            workspace = "u";
          }
          {
            output = mainDesktop;
            workspace = "v";
          }
          {
            output = mainDesktop;
            workspace = "w";
          }
          {
            output = mainDesktop;
            workspace = "x";
          }
          {
            output = mainDesktop;
            workspace = "y";
          }
          {
            output = mainDesktop;
            workspace = "z";
          }
        ];
        assigns = {
          "number 10" = [ { class = "^Chromium-browser$"; } ];
          "e" = [ { class = "^dev.zed.Zed$"; } ];
          "r" = [ { class = "^thunderbird$"; } ];
          "t" = [ { class = "^AyuGramDesktop$"; } ];
          "s" = [ { class = "^Slack$"; } ];
          "a" = [ { class = "^anytype$"; } ];
          "d" = [ { class = "^discord$"; } ];
          "f" = [ { class = "^zen$"; } ];
          "g" = [ { class = "^kitty$"; } ];
          "c" = [ { class = "^Google-chrome$"; } ];
          "b" = [ { class = "^Zathura$"; } ];
        };
        startup = [
          {
            command = "AmneziaVPN";
            notification = false;
          }
          {
            command = "zeditor";
            notification = false;
          }
          {
            command = "thunderbird";
            notification = false;
          }
          {
            command = "AyuGram";
            notification = false;
          }
          {
            command = "anytype";
            notification = false;
          }
          {
            command = "slack";
            notification = false;
          }
          {
            command = "discord";
            notification = false;
          }
          {
            command = "zen-beta";
            notification = false;
          }
          {
            command = "kitty";
            notification = false;
          }
        ];
      };
    };
}
