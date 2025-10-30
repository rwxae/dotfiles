{ lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    package = null;
    portalPackage = null;
    settings =
      let
        mod = "SUPER";
        mainDesktop = "DP-1";
        secondDesktop = "HDMI-A-2";
        numbers = lib.stringToCharacters "123456789";
        letters = lib.stringToCharacters "abcdefgimnopqrstuvwxyz";
        launchApp = app: "uwsm app -- ${app}";
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
        };

        animations.enabled = false;

        layerrule = [
          "blur, vicinae"
          "ignorealpha 0, vicinae"
        ];

        windowrulev2 = [
          "float, class:^(com.saivert.pwvucontrol)$"
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

        workspace = lib.flatten [
          "10, monitor:${secondDesktop}"
          (numbers |> map (w: "${w}, monitor:${mainDesktop}"))
          "name:f, monitor:${secondDesktop}"
          (letters |> builtins.filter (w: w != "f") |> map (w: "name:${w}, monitor:${mainDesktop}"))
        ];

        bind = lib.flatten [
          "${mod}, space, exec, ${launchApp "vicinae toggle"}"

          ", xf86audiolowervolume, exec, volumectl -u down"
          ", xf86audioraisevolume, exec, volumectl -u up"
          ", xf86audioplay, exec, playerctl play-pause"
          ", xf86audioprev, exec, playerctl previous"
          ", xf86audionext, exec, playerctl next"

          "${mod}, h, movefocus, l"
          "${mod}, j, movefocus, d"
          "${mod}, k, movefocus, u"
          "${mod}, l, movefocus, r"

          "${mod}+shift, h, movewindow, l"
          "${mod}+shift, j, movewindow, d"
          "${mod}+shift, k, movewindow, u"
          "${mod}+shift, l, movewindow, r"

          "${mod}+control, h, movecurrentworkspacetomonitor, l"
          "${mod}+control, l, movecurrentworkspacetomonitor, r"
          "${mod}+control, q, killactive"

          "${mod}, 0, workspace, 10"
          (numbers |> map (w: "${mod}, ${w}, workspace, ${w}"))
          (letters |> map (w: "${mod}, ${w}, workspace, name:${w}"))

          "${mod}+shift, 0, movetoworkspace, 10"
          (numbers |> map (w: "${mod}+shift, ${w}, movetoworkspace, ${w}"))
          (letters |> map (w: "${mod}+shift, ${w}, movetoworkspace, name:${w}"))
        ];

        bindm = [
          "${mod}, mouse:272, movewindow"
          "${mod}, mouse:273, resizewindow"
        ];

        exec-once = [
          (launchApp "zeditor")
          (launchApp "thunderbird")
          (launchApp "Telegram")
          (launchApp "anytype")
          (launchApp "slack")
          (launchApp "discord")
          (launchApp "zen-beta")
          (launchApp "kitty")
        ];
      };
  };
}
