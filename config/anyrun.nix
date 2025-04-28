{ inputs, pkgs, ... }: {
  nix.settings = {
    builders-use-substitutes = true;
    extra-substituters = [ "https://anyrun.cachix.org" ];

    extra-trusted-public-keys =
      [ "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s=" ];
  };
  environment.systemPackages = [ inputs.anyrun.packages.aarch64-linux.anyrun ];

  home-manager.users.josef = {
    imports = [ inputs.anyrun.homeManagerModules.default ];
    programs.anyrun = {
      enable = true;

    };
  };
}
