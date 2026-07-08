{ ... }:

{
  programs.vicinae = {
    enable = true;
    systemd.enable = true;
    settings = {
      launcher_window = {
        compact_mode.enabled = true;
      };
      keybinding = "emacs";
      pop_on_backspace = false;
      pop_to_root_on_close = true;
    };
  };
}
