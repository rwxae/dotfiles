{ ... }:

{
  imports = [
    ../shared
    ./programs
    ./services
  ];

  networking = {
    networkmanager.enable = true;
  };

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

  security.polkit.enable = true;
  security.rtkit.enable = true;
}
