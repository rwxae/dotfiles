{ pkgs, ... }:

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

  environment = {
    pathsToLink = [ "/share/zsh" ];
  };

  stylix.cursor = {
    package = pkgs.nur.repos.adam0.bibata-modern-cursors-classic-hyprcursor;
    name = "Bibata-Modern-Classic-hyprcursor";
    size = 24;
  };

  security.polkit.enable = true;
  security.rtkit.enable = true;
}
