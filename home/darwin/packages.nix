{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    iina
    keycastr

    colima
    docker
  ];
}
