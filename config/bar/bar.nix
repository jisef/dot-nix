{ config, pkgs, inputs, home-manafer, ... }: {
  home-manager.users.josef = {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          height = 30;
          # ###############
          # MOdules Right
          # ###############
          modules-right = [ "battery" ];

          "battery" = {
            interval = 5;
            format = "{capacity}% {power}W";
            format-icons = [ "" "" "" "" "" ];
            states = {
              warning = 30;
              critical = 5;
            };
          };

          # ###############
          # Modules Center
          # ###############
          modules-center = [ "clock" ];
          "clock" = {
            format = "{:%H:%M, %d.%m.%Y}"; # 20:45, 27.03.2025
            format-alt = "{:%Y-%m-%d}";
          };

          # ###############
          # Modules Left
          # ###############
          modules-left = [ "hyprland/workspaces" ];
          "hyprland/workspaces" = {
            all-outputs = true; # makes the style work on separate monitor
            format = "{name}";
            on-click = "activate";
            separate-outputs =
              true; # waybar only shows workspaces on current monitor
          };
        };
      };
      style = builtins.readFile ./style.css;
    };
  };
}

