{ ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        useGrimAdapter = true;
        disabledGrimWarning = true;
      };
    };
  };
}
