{ ... }:

{
  imports = [
    ./hyprland.nix
    ./steam.nix
  ];

  programs = {
    adb.enable = true;
    amnezia-vpn.enable = true;
    nix-ld.enable = true;
    ssh.startAgent = true;
    bash.blesh.enable = true;
    gamemode.enable = true;
  };
}
