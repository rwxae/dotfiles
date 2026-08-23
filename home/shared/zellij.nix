{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    attachExistingSession = true;
    exitShellOnExit = true;
    settings = {
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
  };
}
