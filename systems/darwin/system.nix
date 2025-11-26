{ inputs, ... }:

{
  system = {
    stateVersion = 6;

    # Set Git commit hash for darwin-version.
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    defaults = {
      CustomUserPreferences = {
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            # Show Spotlight search (disable)
            "64" = {
              enabled = false;
            };
          };
        };
      };

      dock = {
        autohide = true;
        expose-group-apps = true;
        minimize-to-application = true;
        mru-spaces = false;
        show-recents = false;
        showhidden = true;
        tilesize = 40;
      };

      finder = {
        _FXSortFoldersFirst = true;
        FXPreferredViewStyle = "clmv";
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf";
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Other";
        NewWindowTargetPath = "file:///Users/wardxela/Downloads";
        QuitMenuItem = true;
        ShowExternalHardDrivesOnDesktop = false;
        ShowHardDrivesOnDesktop = false;
        ShowMountedServersOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
      };

      hitoolbox.AppleFnUsageType = "Change Input Source";

      menuExtraClock = {
        ShowSeconds = true;
      };

      NSGlobalDomain = {
        _HIHideMenuBar = true;
        AppleFontSmoothing = 0;
        AppleInterfaceStyle = "Dark";
        NSAutomaticWindowAnimationsEnabled = false;
        NSWindowShouldDragOnGesture = true;
      };

      screencapture = {
        include-date = true;
        target = "file";
        location = "~/Pictures/Screenshots";
      };

      spaces.spans-displays = false;

      WindowManager = {
        EnableTiledWindowMargins = false;
        EnableTilingByEdgeDrag = false;
        EnableTilingOptionAccelerator = false;
        EnableTopTilingByEdgeDrag = false;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
