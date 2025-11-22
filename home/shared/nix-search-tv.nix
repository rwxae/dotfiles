{ pkgs, ... }:

let
  # mkOptions =
  #   modules:
  #   inputs.unf.lib.json {
  #     inherit (inputs) self;
  #     inherit pkgs modules;
  #   };
  # noctaliaOptions = mkOptions [
  #   inputs.noctalia.nixosModules.default
  # ];
  # noctaliaHomeOptions = mkOptions [
  #   inputs.noctalia.homeModules.default
  # ];
  # solaarOptions = mkOptions [
  #   inputs.solaar.nixosModules.default
  # ];
  ns-script =
    {
      url = "https://raw.githubusercontent.com/3timeslazy/nix-search-tv/refs/heads/main/nixpkgs.sh";
      hash = "sha256-bEiwM2i9+AKpUuWV3D4y+EIm5AxArczz8Dpmf0R8svw=";
    }
    |> pkgs.fetchurl
    |> builtins.readFile
    |> pkgs.writeShellScriptBin "ns";
in
{
  programs.nix-search-tv = {
    enable = true;
    # settings = {
    #   experimental = {
    #     options_file = {
    #       noctalia = "${noctaliaOptions}";
    #       noctalia-home = "${noctaliaHomeOptions}";
    #       solaar = "${solaarOptions}";
    #     };
    #   };
    # };
  };
  home.packages = [ ns-script ];
}
