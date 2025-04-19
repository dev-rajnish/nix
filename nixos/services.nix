{
  config,
  pkgs,
  username,
  ...
}: {
  hardware.enableAllFirmware = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.displayManager.sddm.wayland.enable = true;
  ## DisplayManager
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "${username}";

  #services.desktopManager.plasma6.enable = true;

  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  ## services.xserver.libinput.enable = true; # default true

  ## Enable automatic login for the user.
  services.getty.autologinUser = "${username}";

  services.logind.powerKey = "ignore";
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-wlr];

  services.udisks2.enable = true;

  services.power-profiles-daemon.enable = false; # gnome

  services.upower.enable = true;
  services.tlp.enable = true;

  services.journald.extraConfig = ''
    SystemMaxUse=100M
    RuntimeMaxUse=50M
    MaxRetentionSec=1month
  '';

  services.fstrim.enable = true;

  services.timesyncd.enable = true;
}
