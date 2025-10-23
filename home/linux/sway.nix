{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    kooha
  ];

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config =
      let
        mod = "Mod4";
        mainDesktop = "DP-1";
        secondDesktop = "HDMI-A-2";
      in
      {
        modifier = mod;
        input = {
          "*" = {
            xkb_layout = "us,ru";
            xkb_options = "grp:caps_toggle";
            repeat_delay = "225";
            repeat_rate = "30";
          };
        };
        output = {
          "${mainDesktop}" = {
            pos = "0 0";
          };
          "${secondDesktop}" = {
            pos = "1920 0";
          };
        };
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
              title = "AmneziaVPN";
            }
            {
              app_id = "com.saivert.pwvucontrol";
            }
            {
              app_id = "gcolor3";
            }
            {
              app_id = "nemo";
            }
            {
              app_id = "com.belmoussaoui.Authenticator";
            }
          ];
        };
        bars = [ ];
        bindkeysToCode = true;
        keybindings = {
          "${mod}+control+q" = "kill";
          "${mod}+space" = "exec rofi -show combi";

          "XF86AudioLowerVolume" = "exec volumectl -u down";
          "XF86AudioRaiseVolume" = "exec volumectl -u up";

          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          "${mod}+shift+h" = "move left";
          "${mod}+shift+j" = "move down";
          "${mod}+shift+k" = "move up";
          "${mod}+shift+l" = "move right";

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
          "${mod}+q" = "workspace q";
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

          "${mod}+shift+1" = "move container to workspace number 1";
          "${mod}+shift+2" = "move container to workspace number 2";
          "${mod}+shift+3" = "move container to workspace number 3";
          "${mod}+shift+4" = "move container to workspace number 4";
          "${mod}+shift+5" = "move container to workspace number 5";
          "${mod}+shift+6" = "move container to workspace number 6";
          "${mod}+shift+7" = "move container to workspace number 7";
          "${mod}+shift+8" = "move container to workspace number 8";
          "${mod}+shift+9" = "move container to workspace number 9";
          "${mod}+shift+0" = "move container to workspace number 10";
          "${mod}+shift+a" = "move container to workspace a";
          "${mod}+shift+b" = "move container to workspace b";
          "${mod}+shift+c" = "move container to workspace c";
          "${mod}+shift+d" = "move container to workspace d";
          "${mod}+shift+e" = "move container to workspace e";
          "${mod}+shift+f" = "move container to workspace f";
          "${mod}+shift+g" = "move container to workspace g";
          "${mod}+shift+i" = "move container to workspace i";
          "${mod}+shift+q" = "move container to workspace q";
          "${mod}+shift+m" = "move container to workspace m";
          "${mod}+shift+n" = "move container to workspace n";
          "${mod}+shift+o" = "move container to workspace o";
          "${mod}+shift+p" = "move container to workspace p";
          "${mod}+shift+r" = "move container to workspace r";
          "${mod}+shift+s" = "move container to workspace s";
          "${mod}+shift+t" = "move container to workspace t";
          "${mod}+shift+u" = "move container to workspace u";
          "${mod}+shift+v" = "move container to workspace v";
          "${mod}+shift+w" = "move container to workspace w";
          "${mod}+shift+x" = "move container to workspace x";
          "${mod}+shift+y" = "move container to workspace y";
          "${mod}+shift+z" = "move container to workspace z";

          "${mod}+Ctrl+h" = "move workspace to output left";
          "${mod}+Ctrl+l" = "move workspace to output right";
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
          "e" = [ { app_id = "dev.zed.Zed"; } ];
          "r" = [ { app_id = "thunderbird"; } ];
          "t" = [ { app_id = "org.telegram.desktop"; } ];
          "a" = [ { app_id = "anytype"; } ];
          "s" = [ { app_id = "Slack"; } ];
          "d" = [ { class = "^discord$"; } ];
          "f" = [ { app_id = "zen-beta"; } ];
          "g" = [ { app_id = "kitty"; } ];
          "c" = [ { app_id = "chromium-browser"; } ];
          "b" = [ { app_id = "org.pwmt.zathura"; } ];
        };
        startup = [
          {
            command = "AmneziaVPN";
          }
          {
            command = "zeditor";
          }
          {
            command = "thunderbird";
          }
          {
            command = "Telegram";
          }
          {
            command = "anytype";
          }
          {
            command = "slack";
          }
          {
            command = "discord";
          }
          {
            command = "zen-beta";
          }
          {
            command = "kitty";
          }
          {
            command = "chromium";
          }
        ];
      };
  };

  programs.swaylock.enable = true;

  services = {
    cliphist.enable = true;
    flameshot = {
      enable = true;
      settings = {
        General = {
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          useGrimAdapter = true;
          disabledGrimWarning = true;
        };
      };
    };
  };
}
