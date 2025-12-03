{
  lib,
  pkgs,
  config,
  ...
}:

{
  options.mySystem.hyprland = {
    monitors = {
      primary = lib.mkOption {
        type = lib.types.str;
        description = "Primary monitor name";
      };
      secondary = lib.mkOption {
        type = lib.types.str;
        description = "Secondary monitor name";
      };
    };
  };

  config =
    let
      cfg = config.mySystem.hyprland;
    in
    {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;
        package = null;
        portalPackage = null;
        plugins = with pkgs.hyprlandPlugins; [
          hypr-dynamic-cursors
        ];
        settings =
          let
            mod = "SUPER";
            primaryMonitor = cfg.monitors.primary;
            secondaryMonitor = cfg.monitors.secondary;
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

            monitor = [
              "${primaryMonitor}, 1920x1080@144, 1920x0, 1"
              "${secondaryMonitor}, 1920x1080@60, 0x0, 1"
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

            layerrule = [
              "blur, vicinae"
              "ignorealpha 0, vicinae"
            ];

            windowrulev2 = [
              "float, class:^(com.saivert.pwvucontrol)$"
              "float, class:^(nemo)$"
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
              (numbers |> map (w: "${w}, monitor:${primaryMonitor}"))
              "name:f, monitor:${secondaryMonitor}"
              (letters |> builtins.filter (w: w != "f") |> map (w: "name:${w}, monitor:${primaryMonitor}"))
            ];

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

              "${mod}+control, r, exec, ${launchApp "hyprshot -m region --freeze --clipboard-only"}"
              "${mod}+control, s, exec, ${launchApp "hyprshot -m output --clipboard-only"}"
              "${mod}+control+shift, r, exec, ${launchApp "hyprshot -m region --freeze"}"
              "${mod}+control+shift, s, exec, ${launchApp "hyprshot -m output"}"

              (numbers |> map (w: "${mod}, ${w}, workspace, ${w}"))
              (letters |> map (w: "${mod}, ${w}, workspace, name:${w}"))

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

      # TODO: https://github.com/nix-community/stylix/issues/478
      home.pointerCursor.hyprcursor.enable = true;
    };
}
