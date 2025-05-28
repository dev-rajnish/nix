{pkgs, ...}: {
  home.packages = with pkgs; [
    universal-android-debloater
    android-tools
    nerdfetch
    fossil
    eza
    bat
    glow
    git
    curl
    wget
    unzip
    htop
    jq
    ripgrep
    fd
    gcc
    gdb
    fastfetch
    delta # (a pager for git)
    duf # (df)
    dust # , ncdu (du)
    ncdu
    tldr # (man, sort of)
    sd # (sed)
    difftastic # (diff)
    broot # , nnn, ranger (file manager)
    direnv # (load environment variables depending on the current directory)
    httpie # , curlie, xh (for making HTTP requests)
    entr # (run arbitrary commands when files change)
    lazygit # (interactive interfaces for git)
    lazydocker # (interactive interface for docker)
    choose # (the basics of awk/cut)
    atuin # (extremely fancy shell history)
  ];
}
