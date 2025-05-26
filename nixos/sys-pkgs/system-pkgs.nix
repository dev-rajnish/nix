{pkgs, ...}: {
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.symbols-only
  ];

  # Install
  programs.firefox.enable = true;

  environment.variables = {};

  environment.systemPackages = with pkgs; [
    home-manager
    nixos-rebuild-ng
    nixpkgs-fmt
    nix-tree
    nix-init
    cachix
    nix-du
    nix-web
    nix-btm
    nixtract
    nix-index
    nix-update
    nix-search-tv
    nh
    jq
  ];
}
