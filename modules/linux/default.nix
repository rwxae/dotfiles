{ ... }:

{
  imports = [
    ../shared
    ./programs
    ./services
  ];

  system.stateVersion = "24.11";

  virtualisation.docker = {
    rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        dns = [
          "1.1.1.1"
          "1.0.0.1"
        ];
      };
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  security.polkit.enable = true;
  security.rtkit.enable = true; # Enable RealtimeKit for audio purposes
}
