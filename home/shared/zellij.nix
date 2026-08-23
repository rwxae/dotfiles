{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    attachExistingSession = true;
    exitShellOnExit = true;
    settings = {
      default_layout = "main";
      keybinds = {
        unbind._args = [
          "Alt f"
          "Ctrl b"
          "Ctrl n"
          "Ctrl p"
          "Ctrl q"
        ];
      };
      session_serialization = false;
      show_startup_tips = false;
      plugins = {
        autolock = {
          triggers = builtins.concatStringsSep "|" [
            "fzf"
            "git"
            "gitui"
            "hx"
            "tv"
            "yazi"
          ];
        };
      };
    };
    plugins = with pkgs.zellijPlugins; [
      autolock
    ];
    layouts = {
      main.layout._children = [
        {
          default_tab_template._children = [
            {
              pane = {
                _props = {
                  size = 1;
                  borderless = true;
                };
                plugin._props.location = "tab-bar";
              };
            }
            { children = { }; }
            {
              pane = {
                _props = {
                  size = 1;
                  borderless = true;
                };
                plugin._props.location = "status-bar";
              };
            }
          ];
        }
        { tab = { }; }
        { tab = { }; }
        { tab = { }; }
        { tab = { }; }
        { tab = { }; }
        { tab = { }; }
      ];
    };
  };
}
