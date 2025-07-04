{ ... }:

{
  programs.git = {
    enable = true;
    aliases = {
      "glog" = "log --oneline --graph";
    };
    userName = "teesh3rt";
    userEmail = "ilaylevy611@gmail.com";
    lfs.enable = true;
  };
}
