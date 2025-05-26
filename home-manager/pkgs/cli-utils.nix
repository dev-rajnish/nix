{pkgs, ...}: {
  home.packages = with pkgs; [
    universal-android-debloater
    android-tools
    nerdfetch
    fossil
    eza
    bat
    glow

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

    fastfetch
  ];
}
