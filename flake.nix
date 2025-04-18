{
  description = "Lappy NixOS Configuration";

  inputs = {
    # Main nixpkgs (unstable)
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Stable channel
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Stylix (theming)
    stylix.url = "github:danth/stylix";

    # NixVim
    nixvim.url = "github:nix-community/nixvim";

    # GUI package manager
    nix-software-center.url = "github:snowfallorg/nix-software-center";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    stylix,
    nixvim,
    nix-software-center,
    nur,
    ...
  }: let
    system = "x86_64-linux";

    overlays = [nur.overlays.default];

    pkgs = import nixpkgs {
      inherit system overlays;

      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
      ];
      specialArgs = {
        inherit pkgs stylix nixvim nix-software-center nur home-manager;
      };
    };

    homeConfigurations."rsh@nixos" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {
        inherit pkgs stylix nixvim nix-software-center home-manager;
      };
      modules = [
        ./home-manager/home.nix
        stylix.homeManagerModules.stylix
      ];
    };

    formatter.${system} = pkgs.alejandra;
  };
}
