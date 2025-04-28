{inputs, pkgs, ...}: {
  nix.settings = {
    builders-use-substitutes = true;
    extra-substituters = [
        "https://anyrun.cachix.org"
    ];

    extra-trusted-public-keys = [
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    ];
  };
  environment.systemPackages = [ anyrun.packages.${system}.anyrun ];

  programs.anyrun = {

  };
}
