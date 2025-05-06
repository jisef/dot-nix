{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ hyprpolkitagent hyprshot fnott ] ;
  imports = [
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hypridle.nix

  ];
}
