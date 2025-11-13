{ pkgs, ... }:

let
  tmx-script = ./scripts/tmx.sh |> builtins.readFile |> pkgs.writeShellScriptBin "tmx";
in
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    focusEvents = true;
    historyLimit = 5000;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    plugins = with pkgs.tmuxPlugins; [
      extrakto
      fzf-tmux-url
      # tmux-which-key
      # mode-indicator
      # fingers
      # copycat
      # fpp
      # open
      # tilish
    ];
    extraConfig = ''
      set -g status-position top
    '';
  };
  home.packages = [ tmx-script ];
}
