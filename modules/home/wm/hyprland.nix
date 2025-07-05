{ pkgs, ... }:

let
  mod = "SUPER";

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
      ];
      bind = [
        "${mod}, Return, exec, ${pkgs.ghostty}/bin/ghostty"
        "${mod}, Q, killactive"
        "${mod}, D, exec, ${pkgs.fuzzel}/bin/fuzzel"
        "${mod} SHIFT, P, exit"
      ] ++ bindAdditions;
      monitor = "eDP-1, 2048x1280@120, 0x0, 1";
    };
  };
}
