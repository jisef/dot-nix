{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ ghostty ];

  home-manager.users.josef = {
    programs.ghostty = {
      enable = true;
      clearDefaultKeybinds = false;
      enableZshIntegration = true;
      settings = {
        font-family = "JetBrains Mono";
        background-opacity = 0.9;
        background-blur = true;
      };
    };
  };
}
