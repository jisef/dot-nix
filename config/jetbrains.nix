{config, pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    # java 
    #jetbrains.idea-ultimate
    #scenebuilder
    #glib
    #gsettings-desktop-schemas
    #gtk3
    # rust
    jetbrains.rust-rover

    # database
    jetbrains.datagrip

    # c#
    jetbrains.rider

    # php
    #jetbrains.phpstorm
    #php
    #php83Extensions.xdebug

    # go
    #jetbrains.goland
    
  ];
  programs.java = {
    enable = true;
    package = (pkgs.jdk21.override { enableJavaFX = true; });
  };
}
