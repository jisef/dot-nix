{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ hypridle ];
  home-manager.users.josef.services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # avoids multiple hyprlock sessions
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
            timeout = 940; # 4 min.
            on-timeout = "brightnessctl -s set 5";
            on-resume = "brightnessctl -r";
        }
        {
          timeout = 900; # 9 min.
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 1200; # 20 min.
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
