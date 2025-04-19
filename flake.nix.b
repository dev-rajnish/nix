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
    var = import ./var.nix;
    system = var.system;
    username = var.username;
    hostname = var.hostname;
    keyboard-path = var.keyboard-path;
    gh-email = var.gh-email;
    gh-username = var.gh-username;

    overlays = [nur.overlays.default];

    pkgs = import nixpkgs {
      inherit system overlays;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./nixos/configuration.nix
       stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
home-manager.users.rsh = import ./home-manager/home.nix;           }  ];

      specialArgs = {
        # variables for nixos
        inherit
          pkgs
          stylix
          nixvim
          nix-software-center
          nur
          home-manager
          username
          hostname
          keyboard-path
          gh-email
          gh-username
          ;
      };
    };

    homeConfigurations."${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {
        # variables for home-manager
        inherit
          pkgs
          stylix
          nixvim
          nix-software-center
          home-manager
          username
          hostname
          gh-email
          gh-username
          ;
      };

      modules = [
        ./home-manager/home.nix
        stylix.homeManagerModules.stylix
      ];
    };

    formatter.${system} = pkgs.alejandra;
  };
}
