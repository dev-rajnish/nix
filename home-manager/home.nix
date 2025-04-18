{
  config,
  pkgs,
  username,
  gh-email,
  gh-username,
  ...
}: {
  imports = [
    ./yazi.nix
    ./stylix.nix
  ];

  home.packages = with pkgs; [
    nerdfetch
  ];
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "${gh-username}";
    userEmail = "${gh-email}";

    extraConfig = {
      credential = {
        helper = "store";
      };
      url."https://github.com/" = {
        insteadOf = ["gh:" "github:"];
      };
    };
  };
}
