{
  config,
  pkgs,
  username,
  nixvim,
  ...
}: {
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.symbols-only
  ];
  # Install
  programs.firefox.enable = true;
  # programs.fish.enable = true;
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
      nur.repos.mic92.hello-nur
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

    ignoreShellProgramCheck = true;
  };
  environment.variables = {
    EDITOR = "nvim";
    #SHELL = "fish";
    TERM = "wezterm";
  };
  environment.systemPackages = with pkgs; [
    nixvim.packages.x86_64-linux.default
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
