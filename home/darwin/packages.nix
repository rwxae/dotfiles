{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    # TODO: https://github.com/NixOS/nixpkgs/issues/401074
    # amnezia-vpn
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
