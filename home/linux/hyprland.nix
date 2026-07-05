{
  lib,
  pkgs,
  config,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false;
    package = null;
    portalPackage = null;
    plugins = with pkgs.hyprlandPlugins; [ csgo-vulkan-fix ];
    settings =
      let
        mkLuaInline = lib.generators.mkLuaInline;
        toLua = lib.generators.toLua;
        mkArgs = args: { _args = args; };
        bind =
          keys: dispatcher: options:
          mkArgs [
            keys
            dispatcher
            options
          ];
        dsp = {
          exec_cmd = app: mkLuaInline "hl.dsp.exec_cmd(${toLua { } app})";
          focus = arg: mkLuaInline "hl.dsp.focus(${toLua { } arg})";
          dpms =
            arg:
            mkLuaInline ''
              function()
                hl.timer(function()
                  hl.dispatch(hl.dsp.dpms({ monitor = "${arg}" }))
                end, { timeout = 500, type = "oneshot" })
              end
            '';
          window = {
            move = arg: mkLuaInline "hl.dsp.window.move(${toLua { } arg})";
            drag = mkLuaInline "hl.dsp.window.drag()";
            resize = mkLuaInline "hl.dsp.window.resize()";
            close = mkLuaInline "hl.dsp.window.close()";
            kill = mkLuaInline "hl.dsp.window.kill()";
          };
          workspace = {
            move = arg: mkLuaInline "hl.dsp.workspace.move(${toLua { } arg})";
          };
        };
        mod = "SUPER";
        workspaces = lib.stringToCharacters "abcdefgimnopqrstuvwxyz";
      in
      {
        config = {
          general = {
            layout = "scrolling";
            gaps_in = 0;
            gaps_out = 0;
            border_size = 0;
            allow_tearing = true;
          };

          scrolling = {
            column_width = 0.9;
          };

          input = {
            kb_layout = "us,ru";
            kb_options = "grp:caps_toggle";
            repeat_delay = 200;
            repeat_rate = 35;
          };

          animations.enabled = false;

          misc = {
            focus_on_activate = true;
          };

          plugin = {
            csgo_vulkan_fix = {
              fix_mouse = true;
            };
          };
        };

        monitor = [
          {
            output = config.mySystem.monitors.primary;
            mode = "1920x1080@144";
            position = "0x0";
            scale = 1;
          }
          {
            output = config.mySystem.monitors.secondary;
            mode = "1920x1080@60";
            position = "1920x0";
            scale = 1;
            transform = 3;
            disabled = true;
          }
        ];

        layer_rule = [
          {
            match.namespace = "vicinae";
            blur = true;
            ignore_alpha = 0;
          }
        ];

        window_rule = [
          {
            match.class = "nemo";
            float = true;
          }
          {
            match.class = "thunderbird";
            workspace = "name:r";
          }
          {
            match.class = "steam";
            workspace = "name:p";
          }
          {
            match.class = "anytype";
            workspace = "name:a";
          }
          {
            match.class = "slack";
            workspace = "name:s";
          }
          {
            match.class = "discord";
            workspace = "name:d";
          }
          {
            match.class = "zen-beta";
            workspace = "name:f";
          }
          {
            match.class = "kitty";
            workspace = "name:g";
          }
          {
            match.class = "chromium-browser";
            workspace = "name:c";
          }
        ];

        workspace_rule = map (workspace: {
          workspace = "name:${workspace}";
          monitor = config.mySystem.monitors.primary;
        }) workspaces;

        bind = lib.flatten [
          (bind "${mod} + SPACE" (dsp.exec_cmd "uwsm app -- vicinae toggle") { })

          (bind "XF86AudioLowerVolume" (dsp.exec_cmd "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") {
            repeating = true;
            locked = true;
          })
          (bind "XF86AudioRaiseVolume" (dsp.exec_cmd "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+") {
            repeating = true;
            locked = true;
          })
          (bind "XF86AudioPlay" (dsp.exec_cmd "playerctl play-pause") { locked = true; })
          (bind "XF86AudioPrev" (dsp.exec_cmd "playerctl previous") { locked = true; })
          (bind "XF86AudioNext" (dsp.exec_cmd "playerctl next") { locked = true; })

          (bind "${mod} + h" (dsp.focus { direction = "l"; }) { })
          (bind "${mod} + j" (dsp.focus { direction = "d"; }) { })
          (bind "${mod} + k" (dsp.focus { direction = "u"; }) { })
          (bind "${mod} + l" (dsp.focus { direction = "r"; }) { })

          (bind "${mod} + SHIFT + h" (dsp.window.move { direction = "l"; }) { })
          (bind "${mod} + SHIFT + j" (dsp.window.move { direction = "d"; }) { })
          (bind "${mod} + SHIFT + k" (dsp.window.move { direction = "u"; }) { })
          (bind "${mod} + SHIFT + l" (dsp.window.move { direction = "r"; }) { })

          (bind "${mod} + CONTROL + h" (dsp.workspace.move { monitor = "l"; }) { })
          (bind "${mod} + CONTROL + j" (dsp.workspace.move { monitor = "d"; }) { })
          (bind "${mod} + CONTROL + k" (dsp.workspace.move { monitor = "u"; }) { })
          (bind "${mod} + CONTROL + l" (dsp.workspace.move { monitor = "r"; }) { })

          (bind "${mod} + CONTROL + w" (dsp.window.close) { })
          (bind "${mod} + CONTROL + q" (dsp.window.kill) { })

          (bind "${mod} + CONTROL + s" (dsp.exec_cmd "noctalia msg screenshot-region") { })
          (bind "${mod} + CONTROL + c" (dsp.exec_cmd "${lib.getExe pkgs.hyprpicker} --autocopy") { })
          (bind "${mod} + CONTROL + e" (dsp.exec_cmd ''
            ${lib.getExe pkgs.grim} -g "$(${lib.getExe pkgs.slurp})" - |
            ${lib.getExe pkgs.tesseract} - stdout |
            ${lib.getExe' pkgs.wl-clipboard "wl-copy"}
          '') { })

          (bind "${mod} + CONTROL + m" (dsp.dpms config.mySystem.monitors.secondary) { })

          (map (w: bind "${mod} + ${w}" (dsp.focus { workspace = "name:${w}"; }) { }) workspaces)
          (map (
            w: bind "${mod} + SHIFT + ${w}" (dsp.window.move { workspace = "name:${w}"; }) { }
          ) workspaces)

          (bind "${mod} + mouse:272" dsp.window.drag { mouse = true; })
          (bind "${mod} + mouse:273" dsp.window.resize { mouse = true; })
        ];

        on = mkArgs [
          "hyprland.start"
          (mkLuaInline ''
            function()
              hl.exec_cmd("uwsm app -- thunderbird") 
              hl.exec_cmd("uwsm app -- anytype") 
              hl.exec_cmd("uwsm app -- slack") 
              hl.exec_cmd("uwsm app -- discord") 
              hl.exec_cmd("uwsm app -- zen-beta") 
              hl.exec_cmd("uwsm app -- kitty") 
            end'')
        ];
      };
    extraConfig = ''
      hl.plugin.csgo_vulkan_fix.vkfix_app({ app = "cs2", w = 1440, h = 1080 })
    '';
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "noctalia msg session lock";
      };
    };
  };

  # TODO: https://github.com/nix-community/stylix/issues/478
  home.pointerCursor.hyprcursor.enable = true;
}
