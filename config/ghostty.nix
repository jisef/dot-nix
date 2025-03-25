{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ ghostty ];

  home-manager.users.josef = {
    programs.ghostty = {
      enable = true;
      clearDefaultKeybinds = false;
    };
  };
}
