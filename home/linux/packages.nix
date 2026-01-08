{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    pwvucontrol
    prismlauncher
    heroic
    vial
    piper
    nemo
    krita
    yandex-music
    hyprpicker

    # CLI
    android-tools
    tesseract
    playerctl
    wl-clipboard

    # TODO: Should be in the /shared/packages (broken on darwin)
    anytype
    exodus
  ];
}
