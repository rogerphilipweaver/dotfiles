{
  description = "Phils nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";

    # to fix command-not-found on flakes configured systems
    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    overlays = {
      node-build-fix = final: prev: {
        nodejs = prev.nodejs_22;
        nodejs-slim = prev.nodejs-slim_22;
      };
    };
    nixosConfigurations = {
      rpi1 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixosModules
          ./hosts/rpi1/configuration.nix
          inputs.flake-programs-sqlite.nixosModules.programs-sqlite
        ];
      };
      int1 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixosModules
          ./hosts/int1/configuration.nix
          inputs.flake-programs-sqlite.nixosModules.programs-sqlite
        ];
      };
    };

    homeConfigurations = {
      "pw@rpi1" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          inputs.nix-colors.homeManagerModules.default
          ./homeManagerModules
          ./hosts/rpi1/pw.nix
        ];
      };
      "pw@int1" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          inputs.nix-colors.homeManagerModules.default
          ./homeManagerModules
          ./hosts/int1/pw.nix
        ];
      };
      "coder" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        extraSpecialArgs = {
          inherit inputs outputs;
          pkgs-unstable = import nixpkgs-unstable {
            system = "aarch64-linux";
            config.allowUnfree = true;
          };
          user = "coder";
        };
        modules = [
          inputs.nix-colors.homeManagerModules.default
          ./homeManagerModules
          ./hosts/work-dev-box/template.nix
        ];
      };
      "phil@LIB-ML-Weaver" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          overlays = nixpkgs.lib.mapAttrsToList (_: value: value) self.overlays;
        };
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          inputs.nix-colors.homeManagerModules.default
          ./homeManagerModules
          ./hosts/LIB-ML-Weaver/phil.nix
        ];
      };
    };
  };
}
