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
    nicotine-plus
    hyprpicker
    (discord.override { withVencord = true; })

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
