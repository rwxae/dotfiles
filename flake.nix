{
  description = "The Perfect Operating System";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgsForVscode.url = "github:NixOS/nixpkgs/e89cf1c932006531f454de7d652163a9a5c86668";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake/beta";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    solaar.url = "github:Svenum/Solaar-Flake";
    solaar.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nur,
      nix-darwin,
      stylix,
      ...
    }:
    {
      nixosConfigurations =
        let
          nixosModules = [
            nur.modules.nixos.default
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
          ];
        in
        {
          nixos = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [ ./hosts/nixos/configuration.nix ] ++ nixosModules;
          };
          beast = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [ ./hosts/beast/configuration.nix ] ++ nixosModules;
          };
        };

      darwinConfigurations = {
        mac = nix-darwin.lib.darwinSystem {
          specialArgs = { inherit inputs; };
          modules = [
            nur.modules.darwin.default
            home-manager.darwinModules.home-manager
            stylix.darwinModules.stylix
            ./hosts/mac/configuration.nix
          ];
        };
      };

      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
      };
    };
}
