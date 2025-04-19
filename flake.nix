{
  description = "Lappy NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    nixvim.url = "github:dc-tec/nixvim";
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
    var = import ./var.nix;
    system = var.system;
    username = var.username;
    hostname = var.hostname;
    keyboard-path = var.keyboard-path;
    gh-email = var.gh-email;
    gh-username = var.gh-username;

    sharedArgs = {
      inherit
        stylix
        nixvim
        nix-software-center
        nur
        username
        hostname
        keyboard-path
        gh-email
        gh-username
        ;
    };

    overlays = [nur.overlays.default];

    pkgs = import nixpkgs {
      inherit system overlays;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      specialArgs = sharedArgs;

      modules = [
        ./nixos/configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./home-manager/home.nix;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = sharedArgs;
        }
      ];
    };

    formatter.${system} = pkgs.alejandra;
  };
}
