{ walker, inputs, pkgs, ... }: { 
  imports = [inputs.walker.homeManagerModules.default];
  home-manager.users.josef = {
    programs.walker = {
      enable = true;
      runAsService = true;
      config = {
      };
    };
  };

}
