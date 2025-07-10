{ config, pkgs, ... }:

{
  stylix.enable = true;
  stylix.polarity = "dark";

  stylix.targets.qt.enable = false;

  stylix.fonts = {
    serif = config.stylix.fonts.monospace;
    sansSerif = config.stylix.fonts.monospace;
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
    };
  };
}
