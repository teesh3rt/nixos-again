{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  hardware.graphics.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
