{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ hypridle ];
  home-manager.users.josef.services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 120;
          on-timeout = "loginctl lock-session";
        }
      ];
    };
  };
}
