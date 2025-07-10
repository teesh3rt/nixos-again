{ config, ... }:

{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      height = 30;
      spacing = 0;
    
      modules-left = [
        "hyprland/window"
      ];
      modules-center = [];
      modules-right = [
        "cpu"
        "memory"
        "clock"
        "battery"
      ];

      cpu = {
        format = "CPU: {usage}%";
        tooltip = true;
      };

      memory = {
        format = "MEM: {}%";
      };

      battery = {
        format = "BAT: {capacity}%";
      };

      clock = {
        format = "{:%H:%M}";
      };
    };
    style = ''
      #cpu {
        background-color: #${config.lib.stylix.colors.base08};
        color: #${config.lib.stylix.colors.base00};
      }

      #memory {
        background-color: #${config.lib.stylix.colors.base09};
        color: #${config.lib.stylix.colors.base00};
      }

      #clock {
        background-color: #${config.lib.stylix.colors.base0A};
        color: #${config.lib.stylix.colors.base00};
      }

      #battery {
        background-color: #${config.lib.stylix.colors.base0B};
        color: #${config.lib.stylix.colors.base00};
      }

      #window {
        padding-left: 10px;
      }
    '';
  };
}
