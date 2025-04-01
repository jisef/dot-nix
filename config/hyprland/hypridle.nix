{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ hypridle ];
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 10;
          on-timeout = "loginctl lock-session";
        }
      ];
    };
  };
}
