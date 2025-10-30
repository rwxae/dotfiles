{ ... }:

{
  imports = [
    ./hyprland.nix
    ./uwsm.nix
  ];

  programs = {
    adb.enable = true;
    amnezia-vpn.enable = true;
    nix-ld.enable = true;
    ssh.startAgent = true;
    bash.blesh.enable = true;
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;
  };
}
