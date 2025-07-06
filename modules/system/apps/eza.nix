{ pkgs, ... }:

{
  environment.shellAliases = {
    ls = "${pkgs.eza}/bin/eza -lh";
  };
}
