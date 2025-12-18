{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # GUI
    qbittorrent
    hoppscotch
    discord
    slack

    # CLI
    inxi
    ncdu
    duf
    mprocs
    just
    dust
    tabiew
    glow
    speedread
    ggh
    glab
    ffmpeg
    nvd
    git-open

    # Archiving and compression
    zip
    unzip
    unrar

    # Privacy
    gopass
    gopass-jsonapi

    # Development Tools
    devenv

    # LSP
    astro-language-server
    bash-language-server
    docker-compose-language-service
    dockerfile-language-server
    # superhtml
    typescript-language-server
    vscode-langservers-extracted
    marksman
    nil
    prisma-language-server
    taplo
    yaml-language-server
  ];
}
