{ ... }:

{
  programs.zellij = {
    enable = true;

    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };
}
