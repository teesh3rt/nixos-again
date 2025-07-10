{ ... }:

{
  imports = [
    ../../../modules/home/apps/helix.nix
    ../../../modules/home/apps/git.nix
    ../../../modules/home/apps/ghostty.nix
    ../../../modules/home/apps/firefox.nix
    ../../../modules/home/apps/mako.nix
    ../../../modules/home/wm/hyprland.nix
    ../../../modules/home/apps/fuzzel.nix
    ../../../modules/home/apps/zellij.nix
    ../../../modules/home/apps/bat.nix
    ../../../modules/home/apps/kitty.nix
    ../../../modules/home/services/mpd.nix
    ../../../modules/home/services/syncthing.nix
    ../../../modules/home/services/udiskie.nix
  ];
}
