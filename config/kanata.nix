{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ kanata ];

  home-manager.users.josef = {
    services.kanata = {
      enable = true;
      keyboards.default = {
        config = ''
          defalias escape_control = { tap_hold { tap: Control_L, hold: Control_L } }

          defsrc caps_lock

          deflayer default {
              caps_lock = @escape_control
          }
        '';
      };
    };
  };
}
