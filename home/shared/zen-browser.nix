{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.default
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisablePocket = true;
      DisableTelemetry = true;
      OfferToSaveLogins = false;
    };
    profiles = {
      default = {
        id = 0;
      };
      chill = {
        id = 1;
      };
    };
  };

  stylix.targets.zen-browser.profileNames = [
    "default"
    "chill"
  ];
}
