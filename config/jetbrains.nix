{config, pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    # java 
    jetbrains.idea-ultimate
    scenebuilder

    # rust
    jetbrains.rust-rover

    # database
    jetbrains.datagrip

    # php
    jetbrains.phpstorm
    php
    
  ];
  programs.java = {
    enable = true;
    package = (pkgs.jdk21.override { enableJavaFX = true; });
  };
}
