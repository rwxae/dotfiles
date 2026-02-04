{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    monitorcontrol
    iina
    keka
    keycastr
    discord

    # Development Tools
    colima # TODO: replace on container - https://github.com/apple/container/issues/66
    docker
  ];
}
