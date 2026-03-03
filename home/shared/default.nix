{ ... }:

{
  imports = [
    ./aichat.nix
    ./asciinema.nix
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./eza.nix
    ./fastfetch.nix
    ./fd.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./gitui.nix
    ./gpg.nix
    ./helix.nix
    ./kitty.nix
    ./lazydocker.nix
    ./nix-search-tv.nix
    ./oh-my-posh.nix
    ./opencode.nix
    ./packages.nix
    ./ripgrep.nix
    ./television.nix
    ./thunderbird.nix
    ./tmux.nix
    ./yazi.nix
    ./yt-dlp.nix
    ./zed-editor.nix
    ./zen-browser.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
