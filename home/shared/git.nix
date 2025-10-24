{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "wardxela";
        email = "wardxela" + "@" + "gmail" + "." + "com";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
        default = "current";
      };
    };
  };
}
