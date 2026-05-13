{
  description = "macOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-darwin";
  in
  {
    darwinConfigurations."simple" = nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        ./configuration.nix
        home-manager.darwinModules.home-manager
        {
          nixpkgs.config.allowUnfree = true;

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.blau = import ./home.nix;
          };
        }
      ];
    };
  };
}
