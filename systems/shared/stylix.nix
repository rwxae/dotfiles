{ pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
    polarity = "dark";
    fonts = with pkgs; {
      serif = {
        package = source-serif;
        name = "EB Garamond";
      };
      sansSerif = {
        package = inter;
        name = "Inter";
      };
      monospace = {
        package = nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };
  };
}
