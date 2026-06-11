{ pkgs, ... }:

{
  imports = [
    ../shared
    ./programs
    ./services
  ];

  system.stateVersion = "25.05";

  networking = {
    networkmanager.enable = true;
    firewall.checkReversePath = "loose";
  };

  virtualisation.docker = {
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];
  };

  stylix.cursor = {
    package = pkgs.rose-pine-hyprcursor;
    name = "rose-pine-hyprcursor";
    size = 32;
  };

  security.polkit.enable = true;
  security.rtkit.enable = true;
}
