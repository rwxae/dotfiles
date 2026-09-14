{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    monitorcontrol
    iina
    keycastr

    colima
    docker
  ];
}
