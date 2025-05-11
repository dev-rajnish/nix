{
  config,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./yazi.nix
    ./stylix.nix
    ./git.nix
    ./home-pkg.nix
    ./wezterm.nix
    ./waypaper.nix
    ./waybar/waybar.nix
    ./shell.nix
    ./config/config.nix
  ];
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
}
