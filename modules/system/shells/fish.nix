{ pkgs, ... }:

{
  programs.fish.enable = true;
  users.users.ilay.shell = pkgs.fish;
}
