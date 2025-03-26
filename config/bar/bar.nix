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
            interval = 60;
          };
          modules-left = ["hyprland/workspaces"];

          "hyprland/workspaces" = {
            format = "{name}";
            
          };
        };
      };
      style = builtins.readFile ./style.css;
    };
  };
}

