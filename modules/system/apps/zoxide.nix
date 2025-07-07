{ ... }:

{
  programs.zoxide = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableXonshIntegration = true;
  };

  programs.bash.shellAliases = {
    "cd" = "z";
  };
  programs.zsh.shellAliases = {
    "cd" = "z";
  };
  programs.fish.shellAliases = {
    "cd" = "z";
  };
  # i couldn't find an easy way to alias in xonsh, sorry!
}
