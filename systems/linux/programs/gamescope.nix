{ ... }:

{
  programs.gamescope = {
    enable = true;
    enableWsi = true;
    # TODO: fails to run
    # capSysNice = true;
  };
}
