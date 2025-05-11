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

  environment.variables = {};

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
