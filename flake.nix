{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    apple-silicon-support.url =
      "github:tpwrules/nixos-apple-silicon/19b1103d09b4be12bdbf4c713b0e45fc434b5f6a";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    walker.url = "github:abenz1267/walker";
  };

  outputs =
    { self, nixpkgs, apple-silicon-support, home-manager, walker }@inputs: {
      nixosConfigurations.nixos-mac = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./host/laptop-m1/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.josef = import ./host/laptop-m1/home.nix;
            home-manager.backupFileExtension = "backup";
          }

          #walker.homeManagerModules.default

          ./config/git.nix
          ./config/bar/bar.nix
          ./config/obsidian.nix
          # ./config/launcher.nix
          ./config/fastfetch.nix
          ./config/jetbrains.nix

        ];
        specialArgs = { inherit apple-silicon-support home-manager inputs; };
      };
    };
}
