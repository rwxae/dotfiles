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
    ./mergiraf.nix
    ./nix-search-tv.nix
    ./oh-my-posh.nix
    ./packages.nix
    ./ripgrep.nix
    ./television.nix
    ./thunderbird.nix
    ./yazi.nix
    ./yt-dlp.nix
    ./zed-editor.nix
    ./zellij.nix
    ./zen-browser.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
