{config, pkgs, inputs, ...}: {
  home-manager.users.josef = {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          height = 30;
          modules-right = ["battery" "clock"];
          "clock" = {
            format = "{:%H:%M}";
            format-alt = "{:%Y-%m-%d}";
          };

          "battery" = {
            interval = 60;
          };
          modules-left = ["hyprland/workspaces"];

          "hyprland/workspaces" = {
            format = "{name}";
            
          };
        };
      };
      style = ''
        #workspaces button.active {
          background-color: #64727D;
        }
      '';

    };
  };
}

