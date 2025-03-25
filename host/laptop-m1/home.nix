{ config, pkgs, inputs, ... }:

{
  home.username = "josef";
  home.homeDirectory = "/home/josef";
  home.stateVersion = "23.11"; # Adjust to your NixOS version

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Git configuration
  programs.git = {
    enable = true;
    userName = "josef";
  };

  programs.zsh = { enable = true; };

   #Enable GPU support (if using experimental GPU driver)
   home.sessionVariables = {
    LIBGL_ALWAYS_SOFTWARE = "1";
  };
}

