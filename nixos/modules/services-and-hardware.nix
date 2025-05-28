{username, ...}: {
  services = {
    #xserver.libinput.enable = true; # default true

    getty.autologinUser = "${username}";

    fstrim.enable = true;

    logind.powerKey = "ignore";

    timesyncd.enable = true;

    udisks2.enable = true;

    upower.enable = true;

    tlp.enable = true;

    printing.enable = true;

    blueman.enable = true;

    xserver.videoDrivers = [
      "amdgpu"
      "modesetting"
      "fbdev"
    ];
  };

  # sound service
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  # hardware services
  hardware = {
    enableAllFirmware = true;

    graphics.enable = true;

    bluetooth.enable = true;

    uinput.enable = true;
  };

  ### Enable the KDE Plasma Desktop Environment.
  # services.desktopManager.plasma6.enable = true;

  ### DisplayManager
  # services.displayManager.sddm.wayland.enable = true;
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "${username}";

  services.journald.extraConfig = ''
    SystemMaxUse=100M
    RuntimeMaxUse=50M
    MaxRetentionSec=1month
  '';
}
