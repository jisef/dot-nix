{config, pkgs, inputs, home-manafer, ...}: {
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
            interval= 5;
            format = "{capacity}% {power}W";
            format-icons = ["" "" "" "" ""];
            states = {
              warning = 30;
              critical = 5;
            };
          };
          modules-left = ["hyprland/workspaces"];

          "hyprland/workspaces" = {
            all-outputs = true;
            format = "{name}";
            on-click = "activate";
            separate-outputs = true; # way only shows wokrspaces on current monitor
          };
        };
      };
      style = builtins.readFile ./style.css;
    };
  };
}

