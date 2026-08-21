{ lib, ... }:

{
  programs.aerospace = {
    enable = true;
    launchd.enable = true;
    settings =
      let
        mod = "alt-cmd-ctrl";
        workspaces = lib.stringToCharacters "123456789abcdefgimnopqrstuvwxyz";
      in
      {
        automatically-unhide-macos-hidden-apps = true;
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
            "if".app-id = "dev.zed.Zed";
            run = "move-node-to-workspace e";
          }
          {
            "if".app-id = "org.nixos.thunderbird";
            run = "move-node-to-workspace r";
          }
          {
            "if".app-id = "com.anytype.anytype";
            run = "move-node-to-workspace a";
          }
          {
            "if".app-id = "app.zen-browser.zen";
            run = "move-node-to-workspace f";
          }
          {
            "if".app-id = "net.kovidgoyal.kitty";
            run = "move-node-to-workspace g";
          }
        ];
      };
  };
}
