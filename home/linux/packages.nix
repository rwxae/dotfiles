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
    nicotine-plus
    (discord.override { withVencord = true; })
    r2modman

    # CLI
    android-tools
    playerctl
    wl-clipboard

    # TODO: Should be in the /shared/packages (broken on darwin)
    anytype
    exodus
  ];
}
