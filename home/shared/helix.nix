{ ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor.cursor-shape.insert = "bar";
    };
  };
}
