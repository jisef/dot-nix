{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ git lazygit ];

  home-manager.users.josef = {
    programs.git = {
      enable = true;
      userName = "josef";
      userEmail = "josef@sigma.kys";
    };
    programs.lazygit = { enable = true; };
  };
}
