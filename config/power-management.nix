{config, pkgs, inputs, ...}: {
  programs.battery = {
    enable = true;
    chargeLimit = 80;
  };
}
