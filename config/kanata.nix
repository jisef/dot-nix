{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ kanata ];

  users.users.josef.extraGroups = [ "uinput" ];

  services.kanata = {
    enable = true;
    keyboards.default = {
      config = ''
        (defsrc caps)

        (deflayer default
          lctl
        )
      '';
    };
  };
}

