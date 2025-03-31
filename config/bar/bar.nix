{ config, pkgs, inputs, home-manafer, ... }: {
  fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
];
  home-manager.users.josef = {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          height = 35;
          # ###############
          # MOdules Right
          # ###############
          modules-right = [ "network" "battery" ];
          "battery" = {
            interval = 5;
            format = "{icon} {capacity}% {power}W";
            format-charging = "󱐥{capacity}% {power}W";
            format-icons = [ "" "" "" "" "" ];
            
            states = {
              warning = 25;
              critical = 15;
            };
          };

          "network" = {
            tooltip = true;
            interval = 5;
            family = "ipv4";

            format-wifi = "{icon} ({signalStrength}%)";
            format-icons = [ "󰤯" "󰤟" "󰤥" "󰤨"];
            tooltip-format-wifi = "{ifname} \r\n{ipaddr}/{cidr} \r\n{}";
            on-click = "zsh ~/dot-nix/config/bar/connect-wifi.sh";

            format-ethernet = "󰈁";
            tooltip-format-ethernet = "";
            format-disconnected = "󰖪 ";

            
            #tooltip-disconnected = "󰖪";
          };
 

          # ###############
          # Modules Center
          # ###############
          modules-center = [ "clock" ];
          "clock" = {
            format = "{:%H:%M, %d.%m.%Y}"; # 20:45, 27.03.2025
            format-alt = "{:%Y.%m.%d}";
          };

          # ###############
          # Modules Left
          # ###############
          modules-left = [ "hyprland/workspaces" "hyprland/window"];
          "hyprland/workspaces" = {
            all-outputs = true; # makes the style work on separate monitor
            format = "{name}";
            on-click = "activate";
            separate-outputs =
              true; # waybar only shows workspaces on current monitor
          };

          "hyprland/window" = {
            format = "";
            icon = true;
          };
        };
      };
      style = builtins.readFile ./style.css;
    };
  };
}

