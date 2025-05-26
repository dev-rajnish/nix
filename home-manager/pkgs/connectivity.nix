{pkgs, ...}: {
  home.packages = with pkgs; [
    bluez
    wpa_supplicant_gui
  ];
}
