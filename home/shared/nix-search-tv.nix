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
  ns-script =
    {
      url = "https://raw.githubusercontent.com/3timeslazy/nix-search-tv/refs/heads/main/nixpkgs.sh";
      hash = "sha256-XkBL7EdPIETdi8B5k0ww3d66xB7QnW+mFEK2RUihWcY=";
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
