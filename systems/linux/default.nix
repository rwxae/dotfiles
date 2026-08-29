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

  users.defaultUserShell = pkgs.zsh;

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
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 24;
  };

  security.polkit.enable = true;
  security.rtkit.enable = true;
}
