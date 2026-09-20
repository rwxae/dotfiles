{ pkgs, ... }:

{
  imports = [
    ../../systems/linux
    ./hardware-configuration.nix
  ];

  nixpkgs.config.cudaSupport = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  environment.systemPackages = with pkgs; [
    headsetcontrol
  ];
  services.udev.packages = with pkgs; [ headsetcontrol ];

  services.xserver.videoDrivers = [ "nvidia" ];

  networking.hostName = "beast";

  programs.gamescope.args = [
    "--prefer-output"
    "DP-4"
    "--output-width"
    "2560"
    "--output-height"
    "1440"
    "--nested-refresh"
    "180"
  ];

  home-manager.users.rwxae = ./home.nix;

  users.users.rwxae = {
    isNormalUser = true;
    description = "Alexander";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
