{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    authenticator
    pwvucontrol
    prismlauncher
    vial
    gcolor3
    nemo
    krita
    yandex-music

    # CLI
    tesseract
    playerctl

    # TODO: Should be in the /shared/packages
    anytype # https://github.com/NixOS/nixpkgs/pull/411491
    exodus
  ];
}
