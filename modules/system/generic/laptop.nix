{ ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
}
