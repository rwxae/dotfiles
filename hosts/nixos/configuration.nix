{ ... }:

{
  imports = [
    ../../modules/linux
    ./hardware-configuration.nix
  ];

  home-manager.users.wardxela = ./home.nix;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "libata.noacpi=1" ];

  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];
}
