{
  config,
  pkg,
  ...
}: {
  home = {
    username = "rsh";
    homeDirectory = "/home/rsh";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
  programs.git = {
    enable = true;
    userName = "dev-rajnish";
    userEmail = "devrajnish@proton.me";
    extraConfig = {
      url."https://github.com/" = {
        insteadOf = ["gh:" "github:"];
      };
    };
  };
}
