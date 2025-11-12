{ inputs, ... }:

{
  imports = [ ./stylix.nix ];

  nix = {
    settings = {
      trusted-users = [
        "root"
        "wardxela"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };

  time.timeZone = "Europe/Moscow";
}
