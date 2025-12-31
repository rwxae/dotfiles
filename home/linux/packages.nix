{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    pwvucontrol
    prismlauncher
    heroic
    vial
    nemo
    krita
    yandex-music
    hyprpicker

    # CLI
    tesseract
    playerctl
    wl-clipboard

    # TODO: Should be in the /shared/packages
    anytype # https://github.com/NixOS/nixpkgs/pull/411491
    exodus
  ];
}
