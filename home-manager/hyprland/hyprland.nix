{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    systemd.variables = [
      "--all"
    ];
  };

  services.hyprpolkitagent.enable = true;
}
