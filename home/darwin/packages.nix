{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    monitorcontrol
    iina
    keka
    keycastr
    discord

    colima
    docker
  ];
}
