{
  config,
  pkgs,
  nix-software-center,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nix-software-center.packages.${system}.nix-software-center
    gimp
    kdePackages.kdeconnect-kde
    telegram-desktop
    youtube-music
    celluloid
  ];
}
