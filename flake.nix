{
  description = "wardxela flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    quickshell.url = "github:outfoxxed/quickshell";
    quickshell.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";
    noctalia.inputs.quickshell.follows = "quickshell";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
    solaar.url = "github:Svenum/Solaar-Flake/main";
    solaar.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nur,
      stylix,
      nix-darwin,
      solaar,
      ...
    }:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            nur.modules.nixos.default
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            solaar.nixosModules.default
            ./hosts/nixos/configuration.nix
          ];
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
    };
}
