{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      disable_ligatures = "always";
      font_features = "none";
      confirm_os_window_close = "0";
      macos_option_as_alt = "both";
      hide_window_decorations = "titlebar-only";
    };
  };
}
