{config, pkgs, inputs, ... }: { 
  home-manager.users.josef = {
    programs.git = {
      enable = true;
      userName = "josef";
      userEmail = "josef@sigma.kys";
    };
  };
}
