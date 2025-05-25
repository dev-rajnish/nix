{pkgs, ...}: {
  home.packages = with pkgs; [
    hyprsunset
    hypridle
    hyprshot
    rofi-wayland
    wofi
    swaynotificationcenter
    pwvucontrol
    brightnessctl
  ];
}
