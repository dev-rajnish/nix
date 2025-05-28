{system, ...}: {
  # nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.localSystem = {
    # Optional, for reproducibility and limiting bloat
    inherit system;
    gcc.arch = "native";
  };
  nix.settings = {
    max-jobs = "auto";
    cores = 10;
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    always-allow-substitutes = true;
    use-xdg-base-directories = true;
  };
  documentation.man.generateCaches = false;
}
