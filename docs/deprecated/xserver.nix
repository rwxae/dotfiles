{ ... }:

{
  services = {
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      displayManager.lightdm.enable = true;
      autoRepeatDelay = 225;
      autoRepeatInterval = 30;
      xkb = {
        layout = "us,ru";
        options = "grp:caps_toggle";
      };
    };
    displayManager.defaultSession = "none+i3";
  };
  security.pam.services.i3lock.enable = true;
}
