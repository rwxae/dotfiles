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
