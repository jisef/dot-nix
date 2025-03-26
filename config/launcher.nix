{pkgs, inputs, config}: {
    home-manager.users.josef {
        programs.rofi-wayland = {
          enable = true;
          };
    };
};
