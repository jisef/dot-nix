{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ hyprpaper ];

  home-manager.users.josef = {
    # ###############################
    # Hyprpaper
    # ###############################
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = "~/Downloads/wallhaven-016871.jpg";
        wallpaper = [ ",~/Downloads/wallhaven-016871.jpg" ];
      };
    };
  };
}
