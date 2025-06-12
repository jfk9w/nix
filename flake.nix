{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nix-darwin,
    home-manager,
    ...
  } @ inputs: {
    darwinConfigurations = {
      macnug = nix-darwin.lib.darwinSystem {
        modules = [
          ./darwin/macnug.nix
          home-manager.darwinModules.home-manager
          ./home-manager/macnug.nix
        ];
      };
    };
  };
}
