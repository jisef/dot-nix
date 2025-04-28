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
          height = 38;
          margin = "8";
          padding = "1";
          spacing = "4";
          # ###############
          # MOdules Right
          # ###############
          modules-right = [  "network" "battery" "pulseaudio"];
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

          "memory" = {
            format = "{percentage}%";
          };

          "pulseaudio"  = {
            tooltip = true;
            format-muted = "";
            tooltip-format = "{format_source} \r\n{desc}";
            on-click-middle = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.0";
            max-volume = "100";
          }; 
          "load" = {
            interval = "10";
            format = "{load1}%";
            tooltip-format = "1 min: {load1}% \r\n5 min: {load5}% \r\n15 min: {load15}%";
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

