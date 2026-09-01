{ ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      # uBlock Origin Lite
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; }
      # Unhook - Remove YouTube Recommended & Shorts
      { id = "khncfooichmfjbepaaaebmommgaepoid"; }
      # SponsorBlock for YouTube - Skip Sponsorships
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; }
      # Return YouTube Dislike
      { id = "gebbhagfogifgggkldgodflihgfeippi"; }
      # Yang! - Yet Another Bangs anywhere extension
      { id = "ecboojkidbdghfhifefbpdkdollfhicb"; }
      # Copy Current URL
      { id = "okkmnbabeggdmakmnffkoflpdlkmmpcp"; }
      # Simple Translate
      { id = "ibplnjkanclpjokhdolnendpplpjiace"; }
      # DeArrow - Better Titles and Thumbnails
      { id = "enamippconapkdmgfgjchkhakpfinmaj"; }
    ];
  };
}
