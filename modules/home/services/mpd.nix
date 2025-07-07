{ pkgs, config, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "device" # this can be whatever you want
      }

      audio_output {
        type                    "fifo"
        name                    "my_fifo"
        path                    "/tmp/mpd.fifo"
        format                  "44100:16:2"
      }
    '';
    network.listenAddress = "any";
    network.startWhenNeeded = true;
  };

  programs.ncmpcpp.enable = true;
  programs.ncmpcpp.package = pkgs.ncmpcpp.override {
    visualizerSupport = true;
  };
  programs.ncmpcpp.settings = {
    visualizer_data_source = "/tmp/mpd.fifo";
    visualizer_output_name = "my_fifo";
    visualizer_in_stereo = "yes";
    visualizer_type = "spectrum";
    visualizer_look = "+|";
  };

  services.mpd-mpris.enable = true;
}
