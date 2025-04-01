{ config, pkgs, inputs, ... }: {
  imports = [
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hypridle.nix
  ];
}
