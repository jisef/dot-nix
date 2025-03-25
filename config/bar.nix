{config, pkgs, inputs, ...}: {
  home-manager.users.josef = {
    programs.waybar = {
      enable = true;
    };
  };
}

