{ pkgs, ... }:

let
  mod = "SUPER";
  terminal = "${pkgs.kitty}/bin/kitty";

  gen10 = bind: action:
    builtins.genList
    (i: "${bind}, ${toString i}, ${action}, ${toString i}")
    10;

  directional = bind: action:
    [
      "${bind}, left, ${action}, l"
      "${bind}, up, ${action}, u"
      "${bind}, down, ${action}, d"
      "${bind}, right, ${action}, r"
    ];

  workspaceSwitching = gen10 mod "workspace";
  workspaceMoving = gen10 "${mod} SHIFT" "movetoworkspace";
  windowSwitching = directional mod "movefocus";
  windowMoving = directional "${mod} ALT" "movewindow";
  windowSwapping = directional "${mod} SHIFT" "swapwindow";
  bindAdditions = builtins.concatLists [
    workspaceSwitching
    workspaceMoving
    windowSwitching
    windowMoving
    windowSwapping
  ];

  screenshot = ''${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy'';
  
  cursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    hyprcursor.enable = true;
  };
in
{
  home.pointerCursor = cursor;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        "HYPRCURSOR_THEME,${cursor.name}"
        "HYPRCURSOR_SIZE,${toString cursor.size}"
      ];
      exec-once = [
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "${pkgs.mako}/bin/mako"
      ];
      bind = [
        "${mod}, Return, exec, ${terminal}"
        "${mod}, Q, killactive"
        "${mod}, D, exec, ${pkgs.fuzzel}/bin/fuzzel"
        "${mod} SHIFT, S, exec, ${screenshot}"
        "${mod} SHIFT, P, exit"
        "${mod} SHIFT, D, exec, ${pkgs.mako}/bin/makoctl dismiss -a"

        ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioStop, exec, ${pkgs.playerctl}/bin/playerctl stop"
        ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
        ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ", XF86AudioMute, exec, ${pkgs.pulseaudioFull}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, ${pkgs.pulseaudioFull}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, ${pkgs.pulseaudioFull}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 10%+"
        ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 10%-"
      ] ++ bindAdditions;
      monitor = "eDP-1, 2048x1280@120, 0x0, 1";
      input = {
        natural_scroll = true;
        kb_layout = "us,il";
        kb_options = "grp:alt_shift_toggle";
      };
    };
  };
}
