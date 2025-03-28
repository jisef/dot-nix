# home.nix or similar
{ config, pkgs, inputs, ... }:

{
  imports = [
   # inputs.hyprland.homeManagerModules.default
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

    # Flake Inputs -> Hyprland Package
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # For Screenshare
  environment = {
    variables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
  };

  # Hyprland Home-Manager Module
  home-manager.users.josef = {
    wayland.windowManager.hyprland = {
      enable = true;

      # Flake Input -> Hyprland package
      package =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };
  };
  
}
