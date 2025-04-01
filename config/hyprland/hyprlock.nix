{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ hyprlock ];
  home-manager.users.josef = {

    # ###############################
    # Hyprlock
    # ###############################
    programs.hyprlock = {
      enable = true;
      settings = {
        # Background
        background = {
          monitor = "";
          path = "~/Downloads/wallhaven-016871.jpg";
          blur_passes = 2;
        };

        # General
        general = {
          no_fade_in = false;
          no_fade_out = false;
        };

        animations = {
          bezier = "linear, 1,1, 0, 0";
          animation = "fadeIn, 1, 9, linear";
        };

        # Input-Field
        input-field = {
          size = "270, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.35;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0.2)";
          fade_on_empty = false;
          rounding = -1;
          fail_timeout = 900; # in ms
          fail_text = "<b>Womp Womp</b>";
          check_color = "rgb(40, 85, 119)"; # ugly orange
          fail_color = "rgb(253, 32, 32)";
          placeholder_text =
            ''<i><span foreground="##cdd6f4">Input Password...</span></i>'';
          hide_input = false;
          position = "0, -200";
          halign = "center";
          valign = "center";
        };

        label = [
          # Time
          {
            text = ''cmd[update:1000] echo "$(date +"%H:%M")"'';
            font_size = 128;
            font_family = "JetBrainsMono ExtraBold";
            valign = "center";
            halign = "center";
            position = "0, 200";
          }

          # Batter capacity
          {
            text =
              ''cmd[update:1000] cat /sys/class/power_supply/macsmc-battery/capacity %'';
            font_family = "JetBrainsMono Nerd Font";
            font_size = 54;
            valign = "center";
            halign = "center";
            position = "0, -60";
          }

          # Battery Icon
          { 
            font_family = "JetBrainsMono Nerd Font";
            text = "󰁹";
            font_size = 54;
            valign = "center";
            halign = "center";
            position = "80, -60";
          }
        ];
      };
    };
  };
}
