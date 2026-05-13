{ ... }:

{
  programs.git = {
    enable = true;
    userName = "brandonlau6";
    userEmail = "brandonctx0@gmail.com";
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
      pu = "push";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
