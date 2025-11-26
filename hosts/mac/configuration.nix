{ ... }:

{
  imports = [
    ../../modules/darwin
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  security.pam.services.sudo_local.touchIdAuth = true;

  home-manager.users.wardxela = ./home.nix;

  system.primaryUser = "wardxela";
  users.users.wardxela = {
    name = "wardxela";
    home = "/Users/wardxela";
  };
}
