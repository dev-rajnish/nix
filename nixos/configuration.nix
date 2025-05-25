{
  pkgs,
  hostname,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./kmonad.nix
    ./nix-software-center.nix
    ./services.nix
    ./system-pkgs.nix
    ./nix-settings.nix
    ./hyprland.nix
    ./users.nix
    ./user-pkgs.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.logind.powerKey = "ignore";
  hardware.uinput.enable = true;

  # Extra options
  boot.tmp.useTmpfs = true;
  services.fstrim.enable = true;
  services.timesyncd.enable = true;
  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "mitigations=off"
  ];

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

  networking.hostName = "${hostname}";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  #
  system.stateVersion = "24.11";
}
