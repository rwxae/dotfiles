{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
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

  stylix.cursor = {
    package = pkgs.rose-pine-hyprcursor;
    name = "rose-pine-hyprcursor";
    size = 26;
  };

  security.polkit.enable = true;
  security.rtkit.enable = true;
}
