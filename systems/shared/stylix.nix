{ pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
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
    cursor = {
      package = pkgs.nur.repos.adam0.bibata-modern-cursors-classic-hyprcursor;
      name = "Bibata-Modern-Classic-hyprcursor";
      size = 24;
    };
  };
}
