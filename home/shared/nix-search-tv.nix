{ pkgs, ... }:

let
  ns-script =
    {
      url = "https://raw.githubusercontent.com/3timeslazy/nix-search-tv/refs/heads/main/nixpkgs.sh";
      hash = "sha256-Kz1L8S0OCK9i9h79T3ISt9AO23LhT3hZAnNaIyhFYjE=";
    }
    |> pkgs.fetchurl
    |> builtins.readFile
    |> pkgs.writeShellScriptBin "ns";
in
{
  programs.nix-search-tv = {
    enable = true;
  };

  home.packages = [ ns-script ];
}
