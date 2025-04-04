{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ hyprpolkitagent hyprshot ] ;
  imports = [
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hypridle.nix
  ];
}
