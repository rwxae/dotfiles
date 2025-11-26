{ lib, pkgs, ... }:

{
  imports = [
    ../shared
    ./services.nix
    ./system.nix
  ];

  programs.bash.interactiveShellInit = lib.mkBefore ''
    source ${pkgs.blesh}/share/blesh/ble.sh
  '';
}
