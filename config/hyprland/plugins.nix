{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ hyprpolkitagent ] ;
  imports = [
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hypridle.nix
  ];
}
