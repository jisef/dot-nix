{config, pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [ tlp ];
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_macsmc-battery= 40; # Start charging when below 40%
      STOP_CHARGE_THRESH_macsmc-battery= 80;  # Stop charging when above 80%
    };
  };
}
