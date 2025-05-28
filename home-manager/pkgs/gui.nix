{pkgs, ...}: {
  home.packages = with pkgs; [
    #nix-software-center.packages.${system}.nix-software-center
    gimp
    telegram-desktop
    youtube-music
    celluloid
  ];
}
