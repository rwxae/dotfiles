{ ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
      guioptions = ""; # Hide status bar
      recolor = true; # Dark mode
    };
  };
}
