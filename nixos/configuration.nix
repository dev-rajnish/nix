{
  config,
  pkgs,
  hostname,
  username,
  nix-software-center,
  nur,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./kmonad.nix
    ./nix-software-center.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.logind.powerKey = "ignore";
  hardware.uinput.enable = true;

  # Extra options
  boot.tmp.useTmpfs = true;
  services.fstrim.enable = true;
  services.timesyncd.enable = true;
  boot.kernelParams = ["quiet" "loglevel=3" "mitigations=off"];

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

  #services.udev.extraRules = ''KERNEL=="uinput", OWNER="rsh",MODE="0600" '';

  networking.hostName = "${hostname}";

  networking.networkmanager.enable = true;

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

  services.xserver.enable = false;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

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

  # services.xserver.libinput.enable = true; # default true

  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.fish;

    #passwd
    #initialPassword = "rr";

    description = "${username}";
    extraGroups = ["networkmanager" "wheel"];

    packages = with pkgs; [
      kdePackages.kate
      nodejs
      deno
      vscodium
      pipes
      ventoy-full-qt
      universal-android-debloater
      android-tools
      google-chrome
      pkgs. nur.repos.mic92.hello-nur
    ];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "${username}";

  # DisplayManager
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "${username}";

  # Install
  programs.firefox.enable = true;
  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    gnupg
    curl
    wget
    unzip
    htop
    jq
    ripgrep
    fd
    fzf
    gcc
    gdb
    strace
    lldb
    vim
    fastfetch
    htop
    nixpkgs-fmt
    nix-tree
    nix-init
    cachix
    gparted
    bat
    nh
  ];

  nix.settings.experimental-features = "nix-command flakes";

  nix.settings = {
    max-jobs = "auto";
    cores = 0;
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    always-allow-substitutes = true;
    use-xdg-base-directories = true;
  };
  documentation.man.generateCaches = false;

  # Enable for flake
  ## nix.settings.channel.enable = false;

  system.stateVersion = "24.11";

  ## ============ ##

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
}
