{
  lib,
  pkgs,
  config,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    package = null;
    portalPackage = null;
    settings =
      let
        mod = "SUPER";
        primaryMonitor = config.mySystem.monitors.primary;
        secondaryMonitor = config.mySystem.monitors.secondary;
        workspaces = lib.stringToCharacters "123456789abcdefgimnopqrstuvwxyz";
        launchApp = app: "uwsm app -- ${app}";
      in
      {
        input = {
          kb_layout = "us,ru";
          kb_options = "grp:caps_toggle";
          repeat_delay = 200;
          repeat_rate = 35;
        };

        monitor = [
          "${primaryMonitor}, 1920x1080@144, 0x0, 1"
          "${secondaryMonitor}, 1920x1080@60, 1920x0, 1, transform, 3"
        ];

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

        misc = {
          focus_on_activate = true;
        };

        layerrule = [
          "blur on, ignore_alpha 0, match:namespace vicinae"
        ];

        windowrule = [
          "float on, match:class com.saivert.pwvucontrol"
          "float on, match:class nemo"
          "workspace name:r silent, match:class thunderbird"
          "workspace name:a silent, match:class anytype"
          "workspace name:s silent, match:class Slack"
          "workspace name:d silent, match:class discord"
          "workspace name:f silent, match:class zen-beta"
          "workspace name:g silent, match:class kitty"
          "workspace name:c silent, match:class chromium-browser"
        ];

        workspace = (workspaces |> map (w: "name:${w}, monitor:${primaryMonitor}"));

        bind = lib.flatten [
          "${mod}, space, exec, ${launchApp "vicinae toggle"}"

          ", xf86audiolowervolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", xf86audioraisevolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
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

          "${mod}+control, s, exec, ${launchApp "${lib.getExe pkgs.grimblast} --freeze copysave area"}"

          (workspaces |> map (w: "${mod}, ${w}, workspace, name:${w}"))
          (workspaces |> map (w: "${mod}+shift, ${w}, movetoworkspace, name:${w}"))
        ];

        bindm = [
          "${mod}, mouse:272, movewindow"
          "${mod}, mouse:273, resizewindow"
        ];

        exec-once = [
          (launchApp "noctalia-shell")
          (launchApp "thunderbird")
          (launchApp "anytype")
          (launchApp "slack")
          (launchApp "discord")
          (launchApp "zen-beta")
          (launchApp "kitty")
        ];
      };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "noctalia-shell ipc call lockScreen lock";
      };
    };
  };

  # TODO: https://github.com/nix-community/stylix/issues/478
  home.pointerCursor.hyprcursor.enable = true;
}
