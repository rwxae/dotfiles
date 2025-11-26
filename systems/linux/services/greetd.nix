{ lib, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe pkgs.tuigreet} --cmd 'uwsm start hyprland-uwsm.desktop'";
      };
    };
  };
}
