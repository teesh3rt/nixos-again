{ ... }:

{
  services.udiskie = {
    enable = true;
    automount = true;
    tray = "never";
    notify = true;
  };
}
