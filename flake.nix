{
  description = "NixOS Configuration using flake";

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

  outputs = {...} @ inputs: let
    var-file = import ./var.nix;

    sharedArgs = {
      # use in other files at top {hostname}: to directly access variable just by name like system
      inherit
        (var-file) # from var.nix files
        system
        username
        hostname
        keyboard-path
        gh-email
        gh-username
        ;
      inherit
        (inputs) # from inputs
        self
        nixpkgs
        stylix
        home-manager
        nixpkgs-unstable
        nixvim
        nix-software-center
        nur
        ;
    };

    overlays = [nur.overlays.default];

    pkgs = import nixpkgs {
      inherit system overlays;
      config.allowUnfree = true;
    };

    inherit
      (sharedArgs) # directly using variables in this file
      self
      nixpkgs
      nur
      system
      username
      hostname
      stylix
      home-manager
      ;
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
