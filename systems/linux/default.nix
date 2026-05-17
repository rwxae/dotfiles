{ pkgs, ... }:

{
  imports = [
    ../shared
    ./programs
    ./services
  ];

  networking = {
    networkmanager.enable = true;
    firewall.checkReversePath = "loose";
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

  environment = {
    pathsToLink = [ "/share/zsh" ];
  };

  stylix.cursor = {
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 32;
  };

  security.polkit.enable = true;
  security.rtkit.enable = true;
}
