{
  lib,
  pkgs,
  config,
  ...
}:

let
  rofi-system = pkgs.callPackage ./rofi-system.nix { };
  rofi-cliphist = pkgs.writeScriptBin "rofi-cliphist" ''
    #!/usr/bin/env bash

    if [ -z "$1" ]; then
        cliphist list | sed 's/^\([0-9]\+\)[ \t]*/\1 /'
    else
        cliphist decode <<<"$1" | wl-copy
    fi
  '';
in
{
  stylix.targets.rofi.enable = false;
  programs.rofi = {
    enable = true;
    terminal = lib.getExe pkgs.kitty;
    plugins = with pkgs; [
      rofi-emoji
      rofi-calc
      rofi-system
      rofi-cliphist
    ];
    extraConfig = {
      kb-row-up = "Up,Control+k";
      kb-row-down = "Down,Control+j";
      kb-mode-next = "Control+l";
      kb-mode-previous = "Control+h";
      kb-accept-entry = "Return";
      kb-remove-to-eol = "Control+Shift+e";
      kb-remove-char-back = "BackSpace,Shift+BackSpace";
      kb-mode-complete = "Control+i";
      modes = "combi,calc,emoji,cliphist:${lib.getExe rofi-cliphist}";
      matching = "fuzzy";
      combi-modes = "drun,window,ssh,system:${lib.getExe rofi-system}";
      combi-display-format = "{text}&#09;<span font='Normal 14px' alpha='50%'>{mode}</span>";
      drun-display-format = "{name}    <span weight='normal' alpha='60%'>{generic}</span>";
      window-format = "{t}";
      display-drun = "Application";
      display-ssh = "        SSH";
      display-window = "     Window";
      # TODO: https://github.com/nix-community/home-manager/issues/4783
      "// calc" = config.lib.formats.rasi.mkLiteral ''

        calc {
          terse: true;
          hint-result: "";
          hint-welcome: "";
        }
        // '';
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          background = mkLiteral "rgb(10, 10, 10)";
          foreground = mkLiteral "#F2F2F2";
          background-selected = mkLiteral "rgba(255, 255, 255, 0.1)";
          rounded-sm = mkLiteral "8px";
          rounded-md = mkLiteral "10px";
        };

        window = {
          width = mkLiteral "774px";
          background-color = mkLiteral "@background";
          border = mkLiteral "1px";
          border-color = mkLiteral "rgb(0, 0, 0)";
          border-radius = mkLiteral "@rounded-md";
        };

        mainbox = {
          background-color = mkLiteral "inherit";
          border = mkLiteral "1px";
          border-color = mkLiteral "rgba(255, 255, 255, 0.1)";
          border-radius = mkLiteral "@rounded-md";
          children = map mkLiteral [
            "inputbar"
            "line-separator"
            "message"
            "listview"
          ];
        };

        inputbar = {
          background-color = mkLiteral "inherit";
          children = map mkLiteral [ "entry" ];
        };

        line-separator = {
          background-color = mkLiteral "inherit";
          background-image = mkLiteral ''
            linear-gradient(
                      to right,
                      transparent,
                      rgba(255, 255, 255, 0.05),
                      rgba(255, 255, 255, 0.1),
                      rgba(255, 255, 255, 0.1),
                      rgba(255, 255, 255, 0.1),
                      rgba(255, 255, 255, 0.1),
                      rgba(255, 255, 255, 0.05),
                      transparent,
                      transparent,
                      transparent
                    )'';
          expand = false;
          padding = mkLiteral "1px 0 0";
        };

        message = {
          background-color = mkLiteral "inherit";
          padding = mkLiteral "8px 8px 0 8px";
          children = map mkLiteral [ "textbox" ];
        };

        textbox = {
          background-color = mkLiteral "@background-selected";
          text-color = mkLiteral "@foreground";
          font = "Medium 30px";
          padding = mkLiteral "34px";
          border-radius = mkLiteral "@rounded-sm";
        };

        entry = {
          font = "Medium 18px";
          placeholder = "Search for apps and commands...";
          placeholder-color = mkLiteral "rgba(242, 242, 242, 0.5)";
          padding = mkLiteral "20px 16px";
          text-color = mkLiteral "@foreground";
          background-color = mkLiteral "inherit";
        };

        prompt = {
          text-color = mkLiteral "@foreground";
        };

        listview = {
          background-color = mkLiteral "inherit";
          padding = mkLiteral "8px";
          lines = 8;
        };

        element = {
          background-color = mkLiteral "inherit";
          padding = mkLiteral "14px 8px";
          spacing = mkLiteral "14px";
          children = map mkLiteral [
            "element-icon"
            "element-text"
          ];
          border-radius = mkLiteral "@rounded-sm";
        };

        "element.selected" = {
          background-color = mkLiteral "@background-selected";
        };

        element-icon = {
          background-color = mkLiteral "transparent";
          size = mkLiteral "20px";
        };

        element-text = {
          background-color = mkLiteral "transparent";
          font = "Medium 15px";
          vertical-align = mkLiteral "0.5";
          text-color = mkLiteral "@foreground";
          tab-stops = mkLiteral "[ 616px ]";
        };
      };
  };
}
