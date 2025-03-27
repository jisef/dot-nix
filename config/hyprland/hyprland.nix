{inputs, pkgs, ...}: {
  programs.hyprland.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, F, exec, firefox"
        ", Print, exec, grimblast copy area"
      ];
      # Add more Hyprland-specific settings here
    };
  };
}
