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
    (discord.override { withVencord = true; })
    r2modman

    # CLI
    playerctl
    wl-clipboard

    # TODO: Should be in the /shared/packages (broken on darwin)
    anytype
  ];
}
