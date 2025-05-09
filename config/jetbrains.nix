{config, jetbrainsPkgs, pkgs, inputs, ...}: {
  environment.systemPackages = with jetbrainsPkgs; [
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

    # go
    jetbrains.goland
    
  ];
  programs.java = {
    enable = true;
    package = (pkgs.jdk21.override { enableJavaFX = true; });
  };
}
