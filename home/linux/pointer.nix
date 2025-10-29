{ pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 24;
    hyprcursor.enable = true;
  };
}
