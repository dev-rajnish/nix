{config, ...}: {
  #nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = "nix-command flakes";

  nix.settings = {
    max-jobs = "auto";
    cores = 0;
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    always-allow-substitutes = true;
    use-xdg-base-directories = true;
  };
  documentation.man.generateCaches = false;
}
