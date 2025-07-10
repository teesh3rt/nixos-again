{ inputs, pkgs, ... }:

let
  spice = inputs.spicetify.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spice.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];
  }; 
}
