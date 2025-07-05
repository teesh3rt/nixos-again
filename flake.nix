{
  description = "Teesh's Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix/release-25.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, stylix }: {
    nixosConfigurations.taki = nixpkgs.lib.nixosSystem {
      modules = [
        ./machines/taki/system/configuration.nix
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ilay = ./machines/taki/home/home.nix;
        }
      ];
    };
  };
}
