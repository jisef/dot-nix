{config, pkgs, ...}:{
  environment.systemPackages = with pkgs; [ fuzzel ];
  home-manager.users.josef = {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          terminal = "${pkgs.ghostty}/bin/ghostty";
          show-actions = true;
        };
      };
    };
  };
}
