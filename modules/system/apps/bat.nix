{ config, ... }:

{
  programs.bat.enable = true;

  environment.shellAliases = {
    cat = "${config.programs.bat.package}/bin/bat";
  };
}
