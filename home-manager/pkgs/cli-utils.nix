{ pkgs, ... }:
{
  home.packages = with pkgs; [
    universal-android-debloater
    android-tools
    nerdfetch
    fossil
    eza
    glow
  ];
}
