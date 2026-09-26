{ ... }:

{
  programs.vicinae = {
    enable = true;
    systemd.enable = true;
    settings = {
      launcher_window = {
        compact_mode.enabled = true;
      };
      pop_on_backspace = false;
      pop_to_root_on_close = true;
      telemetry.system_info = false;
      tray.enabled = false;
    };
  };
}
