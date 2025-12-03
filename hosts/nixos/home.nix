{ ... }:

{
  imports = [ ../../home/linux ];

  mySystem.hyprland = {
    monitors = {
      primary = "DP-1";
      secondary = "HDMI-A-2";
    };
  };
}
