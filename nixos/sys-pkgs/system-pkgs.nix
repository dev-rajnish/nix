{pkgs, ...}: {
  environment.variables = {
    MAN_DISABLE_CACHE = 1;
  };

  environment.systemPackages = with pkgs; [
    home-manager
  ];
}
