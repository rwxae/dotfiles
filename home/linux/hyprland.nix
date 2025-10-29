{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    settings =
      let
        mod = "SUPER";
        mainDesktop = "DP-1";
        secondDesktop = "HDMI-A-2";
      in
      {
        input = {
          kb_layout = "us,ru";
          kb_options = "grp:caps_toggle";
          repeat_delay = 200;
          repeat_rate = 35;
        };

        general = {
          gaps_in = 0;
          gaps_out = 0;
          border_size = 0;
          allow_tearing = true;
        };

        decoration = {
          rounding = 0;
          blur.enabled = false;
        };

        animations.enabled = false;

        windowrulev2 = [
          "float, class:^(com.saivert.pwvucontrol)$"
          "float, class:^(gcolor3)$"
          "float, class:^(nemo)$"
          "workspace 10 silent, class:^(Chromium-browser)$"
          "workspace name:e silent, class:^(dev.zed.Zed)$"
          "workspace name:r silent, class:^(thunderbird)$"
          "workspace name:t silent, class:^(org.telegram.desktop)$"
          "workspace name:a silent, class:^(anytype)$"
          "workspace name:s silent, class:^(Slack)$"
          "workspace name:d silent, class:^(discord)$"
          "workspace name:f silent, class:^(zen-beta)$"
          "workspace name:g silent, class:^(kitty)$"
          "workspace name:c silent, class:^(chromium-browser)$"
          "workspace name:b silent, class:^(org.pwmt.zathura)$"
        ];

        workspace = [
          "1, monitor:${mainDesktop}"
          "2, monitor:${mainDesktop}"
          "3, monitor:${mainDesktop}"
          "4, monitor:${mainDesktop}"
          "5, monitor:${mainDesktop}"
          "6, monitor:${mainDesktop}"
          "7, monitor:${mainDesktop}"
          "8, monitor:${mainDesktop}"
          "9, monitor:${mainDesktop}"
          "10, monitor:${secondDesktop}"
          "name:a, monitor:${mainDesktop}"
          "name:b, monitor:${secondDesktop}"
          "name:c, monitor:${secondDesktop}"
          "name:d, monitor:${mainDesktop}"
          "name:e, monitor:${mainDesktop}"
          "name:f, monitor:${secondDesktop}"
          "name:g, monitor:${mainDesktop}"
          "name:i, monitor:${mainDesktop}"
          "name:m, monitor:${mainDesktop}"
          "name:n, monitor:${mainDesktop}"
          "name:o, monitor:${mainDesktop}"
          "name:p, monitor:${mainDesktop}"
          "name:q, monitor:${mainDesktop}"
          "name:r, monitor:${mainDesktop}"
          "name:s, monitor:${mainDesktop}"
          "name:t, monitor:${mainDesktop}"
          "name:u, monitor:${mainDesktop}"
          "name:v, monitor:${mainDesktop}"
          "name:w, monitor:${mainDesktop}"
          "name:x, monitor:${mainDesktop}"
          "name:y, monitor:${mainDesktop}"
          "name:z, monitor:${mainDesktop}"
        ];

        bind = [
          "${mod}, space, exec, rofi -show combi"

          ", xf86audiolowervolume, exec, volumectl -u down"
          ", xf86audioraisevolume, exec, volumectl -u up"

          "${mod}, h, movefocus, l"
          "${mod}, j, movefocus, d"
          "${mod}, k, movefocus, u"
          "${mod}, l, movefocus, r"

          "${mod}+shift, h, movewindow, l"
          "${mod}+shift, j, movewindow, d"
          "${mod}+shift, k, movewindow, u"
          "${mod}+shift, l, movewindow, r"

          "${mod}, 1, workspace, 1"
          "${mod}, 2, workspace, 2"
          "${mod}, 3, workspace, 3"
          "${mod}, 4, workspace, 4"
          "${mod}, 5, workspace, 5"
          "${mod}, 6, workspace, 6"
          "${mod}, 7, workspace, 7"
          "${mod}, 8, workspace, 8"
          "${mod}, 9, workspace, 9"
          "${mod}, 0, workspace, 10"
          "${mod}, a, workspace, name:a"
          "${mod}, b, workspace, name:b"
          "${mod}, c, workspace, name:c"
          "${mod}, d, workspace, name:d"
          "${mod}, e, workspace, name:e"
          "${mod}, f, workspace, name:f"
          "${mod}, g, workspace, name:g"
          "${mod}, i, workspace, name:i"
          "${mod}, q, workspace, name:q"
          "${mod}, m, workspace, name:m"
          "${mod}, n, workspace, name:n"
          "${mod}, o, workspace, name:o"
          "${mod}, p, workspace, name:p"
          "${mod}, r, workspace, name:r"
          "${mod}, s, workspace, name:s"
          "${mod}, t, workspace, name:t"
          "${mod}, u, workspace, name:u"
          "${mod}, v, workspace, name:v"
          "${mod}, w, workspace, name:w"
          "${mod}, x, workspace, name:x"
          "${mod}, y, workspace, name:y"
          "${mod}, z, workspace, name:z"

          "${mod}+shift, 1, movetoworkspace, 1"
          "${mod}+shift, 2, movetoworkspace, 2"
          "${mod}+shift, 3, movetoworkspace, 3"
          "${mod}+shift, 4, movetoworkspace, 4"
          "${mod}+shift, 5, movetoworkspace, 5"
          "${mod}+shift, 6, movetoworkspace, 6"
          "${mod}+shift, 7, movetoworkspace, 7"
          "${mod}+shift, 8, movetoworkspace, 8"
          "${mod}+shift, 9, movetoworkspace, 9"
          "${mod}+shift, 0, movetoworkspace, 10"
          "${mod}+shift, a, movetoworkspace, name:a"
          "${mod}+shift, b, movetoworkspace, name:b"
          "${mod}+shift, c, movetoworkspace, name:c"
          "${mod}+shift, d, movetoworkspace, name:d"
          "${mod}+shift, e, movetoworkspace, name:e"
          "${mod}+shift, f, movetoworkspace, name:f"
          "${mod}+shift, g, movetoworkspace, name:g"
          "${mod}+shift, i, movetoworkspace, name:i"
          "${mod}+shift, q, movetoworkspace, name:q"
          "${mod}+shift, m, movetoworkspace, name:m"
          "${mod}+shift, n, movetoworkspace, name:n"
          "${mod}+shift, o, movetoworkspace, name:o"
          "${mod}+shift, p, movetoworkspace, name:p"
          "${mod}+shift, r, movetoworkspace, name:r"
          "${mod}+shift, s, movetoworkspace, name:s"
          "${mod}+shift, t, movetoworkspace, name:t"
          "${mod}+shift, u, movetoworkspace, name:u"
          "${mod}+shift, v, movetoworkspace, name:v"
          "${mod}+shift, w, movetoworkspace, name:w"
          "${mod}+shift, x, movetoworkspace, name:x"
          "${mod}+shift, y, movetoworkspace, name:y"
          "${mod}+shift, z, movetoworkspace, name:z"

          "${mod}+control, h, movecurrentworkspacetomonitor, l"
          "${mod}+control, l, movecurrentworkspacetomonitor, r"
          "${mod}+control, q, killactive"
        ];

        bindm = [
          "${mod}, mouse:272, movewindow"
          "${mod}, mouse:273, resizewindow"
        ];

        exec-once = [
          "AmneziaVPN"
          "zeditor"
          "thunderbird"
          "Telegram"
          "anytype"
          "slack"
          "discord"
          "zen-beta"
          "kitty"
          "chromium"
        ];
      };
  };
}
