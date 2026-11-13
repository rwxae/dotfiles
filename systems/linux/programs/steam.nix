{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    package = pkgs.steamWithMillennium;
    protontricks.enable = true;
  };
}
