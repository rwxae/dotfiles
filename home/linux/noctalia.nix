{ inputs, config, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings =
      let
        monitors = [ config.mySystem.monitors.primary ];
      in
      {
        bar = {
          inherit monitors;
          outerCorners = false;
          widgets = {
            left = [
              {
                id = "SystemMonitor";
                showDiskUsage = true;
                showNetworkStats = true;
              }
            ];
            center = [
              {
                id = "MediaMini";
                maxWidth = 300;
                showAlbumArt = true;
              }
            ];
            right = [
              {
                id = "Tray";
                colorizeIcons = true;
                drawerEnabled = false;
              }
              {
                id = "KeyboardLayout";
                displayMode = "forceOpen";
              }
              {
                id = "Volume";
                displayMode = "alwaysShow";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "NotificationHistory";
              }
              {
                id = "Clock";
                formatHorizontal = "h:mm AP";
                formatVertical = "h:mm AP";
              }
              {
                id = "ControlCenter";
                useDistroLogo = true;
                colorizeSystemIcon = "primary";
                enableColorization = true;
              }
            ];
          };
        };
        general = {
          animationDisabled = true;
          enableShadows = false;
          dimmerOpacity = 0;
        };
        ui = {
          boxBorderEnabled = true;
        };
        dock.enabled = false;
        notifications = {
          inherit monitors;
        };
        osd = {
          inherit monitors;
          location = "bottom";
        };
        colorSchemes = {
          generateTemplatesForPredefined = false;
        };
      };
  };
}
