{pkgs, config, inputs, ...}: {
  home-manager.users.josef = {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          type = "auto";
          width = 10;
          height = 5;
        };
        modules = [
          {
            type = "custom";
            format = "┌───────────────────── Hardware ─────────────────────┐";
            keyColor = "magenta";
            color = "magenta";
          }
          {
            type = "cpu";
            key = "│ ├";
            keyColor = "magenta";
          }
          {
            type = "gpu";
            key = "│ ├";
            keyColor = "magenta";
          }
          {
            type = "memory";
            key = "│ ├";
            keyColor = "magenta";
          }
          {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
            keyColor = "magenta";
          }
          "break"
          {
            type = "custom";
            format = "┌───────────────────── Software ─────────────────────┐";

            keyColor = "blue";
          }
          {
            type = "os";
            key = "│ ├";
            keyColor = "blue";
          }
          {
            type = "kernel";
            key = "│ ├";
            keyColor = "blue";
          }
          {
            type = "wm";
            key = "│ ├";
            keyColor = "blue"; 
          }
          {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
            keyColor = "blue";
          }
        ];
      };
    };
  };
}

