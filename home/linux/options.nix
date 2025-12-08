{ lib, ... }:

{
  options.mySystem = {
    monitors = {
      primary = lib.mkOption {
        type = lib.types.str;
        description = "Primary monitor";
      };
      secondary = lib.mkOption {
        type = lib.types.str;
        description = "Secondary monitor";
      };
    };
  };
}
