{ config, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "device" # this can be whatever you want
      }
    '';
    network.listenAddress = "any";
    network.startWhenNeeded = true;
  };

  programs.ncmpcpp.enable = true;

  services.mpd-mpris.enable = true;
}
