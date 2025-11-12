{ pkgs, ... }:

{
  stylix = {
    cursor = {
      package = pkgs.nur.repos.adam0.bibata-modern-cursors-classic-hyprcursor;
      name = "Bibata-Modern-Classic-hyprcursor";
      size = 24;
    };
  };
}
