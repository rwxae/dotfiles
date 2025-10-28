{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    authenticator
    pwvucontrol
    prismlauncher
    heroic
    vial
    gcolor3
    nemo
    kooha
    krita
    yandex-music

    # CLI
    tesseract
    playerctl
    wl-clipboard

    # TODO: Should be in the /shared/packages
    anytype # https://github.com/NixOS/nixpkgs/pull/411491
    exodus
  ];
}
