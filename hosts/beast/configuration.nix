{ ... }:

{
  imports = [
    ../../systems/linux
    ./hardware-configuration.nix
  ];

  system.stateVersion = "25.05";

  nixpkgs.config.cudaSupport = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "libata.noacpi=1" ];

  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia.open = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  networking.hostName = "beast";

  # services.zapret = {
  #   enable = true;
  #   params = [
  #     "--dpi-desync=fake,fakedsplit"
  #     "--dpi-desync-fooling=badseq"
  #     "--dpi-desync-split-pos=1"
  #     "--dpi-desync-fake-tls=0x00000000"
  #     "--dpi-desync-fake-tls=!"
  #     "--dpi-desync-fake-tls-mod=rnd,rndsni,dupsid"
  #   ];
  # };

  services.xray = {
    enable = true;
    settingsFile = "/etc/xray/config.json";
  };

  home-manager.users.rwxae = ./home.nix;

  users.users.rwxae = {
    isNormalUser = true;
    description = "Alexander";
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };
}
