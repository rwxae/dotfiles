{ inputs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    inputs.stylix.darwinModules.stylix
    ../shared
    ./system.nix
  ];
}
