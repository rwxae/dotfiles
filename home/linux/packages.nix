{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    pwvucontrol
    prismlauncher
    heroic
    vial
    nemo
    r2modman

    # CLI
    playerctl
    wl-clipboard

    # TODO: Should be in the /shared/packages (broken on darwin)
    anytype
  ];
}
