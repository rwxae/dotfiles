{ lib, ... }:

{
  programs.aerospace = {
    enable = true;
    launchd.enable = true;
    settings =
      let
        mod = "alt-cmd-ctrl";
        workspaces = lib.stringToCharacters "abcdefgimnopqrstuvwxyz";
      in
      {
        config-version = 2;
        automatically-unhide-macos-hidden-apps = true;
        default-root-container-layout = "accordion";
        mode.main.binding = {
          "${mod}-slash" = "layout tiles horizontal vertical";
          "${mod}-comma" = "layout accordion horizontal vertical";

          "${mod}-h" = "focus left";
          "${mod}-j" = "focus down";
          "${mod}-k" = "focus up";
          "${mod}-l" = "focus right";

          "${mod}-shift-h" = "move left";
          "${mod}-shift-j" = "move down";
          "${mod}-shift-k" = "move up";
          "${mod}-shift-l" = "move right";

          "${mod}-minus" = "resize smart -50";
          "${mod}-equal" = "resize smart +50";

          "${mod}-shift-tab" = "move-workspace-to-monitor --wrap-around next";
        }
        // (
          workspaces
          |> map (w: {
            name = "${mod}-${w}";
            value = "workspace ${w}";
          })
          |> builtins.listToAttrs
        )
        // (
          workspaces
          |> map (w: {
            name = "${mod}-shift-${w}";
            value = "move-node-to-workspace ${w}";
          })
          |> builtins.listToAttrs
        );
        on-window-detected = [
          {
            "if" = "test %{app-bundle-id} = dev.zed.Zed";
            run = "move-node-to-workspace e";
          }
          {
            "if" = "test %{app-bundle-id} = org.nixos.thunderbird";
            run = "move-node-to-workspace r";
          }
          {
            "if" = "test %{app-bundle-id} = com.anytype.anytype";
            run = "move-node-to-workspace a";
          }
          {
            "if" = "test %{app-bundle-id} = app.zen-browser.zen";
            run = "move-node-to-workspace f";
          }
          {
            "if" = "test %{app-bundle-id} = net.kovidgoyal.kitty";
            run = "move-node-to-workspace g";
          }
        ];
      };
  };
}
