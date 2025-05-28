{pkgs, ...}: {
  home.packages = with pkgs; [
    rofi-wayland
    wofi
    swaynotificationcenter
    pwvucontrol
    brightnessctl
  ];
}
