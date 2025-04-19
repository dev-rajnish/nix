{
  config,
  pkgs,
  username,
  ...
}: {
  fonts.packages = [
    #   pkgs.nerd-fonts.FiraCode
    pkgs.nerd-fonts.hack
  ];
  # Install
  programs.firefox.enable = true;
  
  users.users.${username} = {
    packages = with pkgs; [
      nodejs
      deno
      vscodium
      pipes
      ventoy-full-qt
      universal-android-debloater
      android-tools
      google-chrome
      pkgs. nur.repos.mic92.hello-nur
      nerdfetch
      wofi
      bluez
      hyprsunset
      hypridle
      rofi-wayland
      satty
      waybar
      swaynotificationcenter
      pwvucontrol
      brightnessctl
      hyprshot
      wezterm
      nwg-displays
      process-viewer
      cbonsai
      cmatrix
    ];
  };

  environment.systemPackages = with pkgs; [
home-manager 
   powertop
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
}
