{
  description = "My flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;

      systemSettings = {
        timeZone = "America/Toronto";
        locale = "en_CA.UTF-8";
        flakeDir = "/home/test/.dotfiles";
      };

      userSettings = {
        username = "test";
      };
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [
            ./nixos/configuration.nix
            stylix.nixosModules.stylix
          ];
        };
      };

      homeConfigurations = {
        "${userSettings.username}@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [
            # > Our main home-manager configuration file <
            ./home/home.nix
          ];
        };
      };
    };
}
