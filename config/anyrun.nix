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
      config = {
        x = { fraction = 0.5; };
        y = { fraction = 0.3; };
        width = { fraction = 0.3; };
        hideIcons = false;
        ignoreExclusiveZones = false;
        layer = "overlay";
        hidePluginInfo = false;
        closeOnClick = false;
        showResultsImmediately = false;
        maxEntries = null;

        plugins = [
          # An array of all the plugins you want, which either can be paths to the .so files, or their packages
          inputs.anyrun.packages.${pkgs.system}.applications
        ];
      };

      # Inline comments are supported for language injection into
      # multi-line strings with Treesitter! (Depends on your editor)
      extraCss = # css
        ''
          .some_class {
            background: red;
          }
        '';

    };
  };
}
