{ pkgs, ... }:

{
  stylix = {
    enable = true;
    # Good trie themes:
    # - evenok-dark
    # - kanagawa-dragon
    # - tomorrow-night
    # - ashes
    base16Scheme = "${pkgs.base16-schemes}/share/themes/github-dark.yaml";
    fonts = with pkgs; {
      serif = {
        package = eb-garamond;
        name = "EB Garamond";
      };
      sansSerif = {
        package = inter;
        name = "Inter";
      };
      monospace = {
        package = pkgs.lilex;
        name = "Lilex";
      };
      emoji = {
        package = pkgs.lilex;
        name = "Lilex";
      };
    };
    cursor = {
      package = pkgs.nur.repos.adam0.bibata-modern-cursors-classic-hyprcursor;
      name = "Bibata-Modern-Classic-hyprcursor";
      size = 32;
    };
  };
}
