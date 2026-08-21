{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    monitorcontrol
    iina
    keka
    keycastr

    colima
    docker
  ];
}
