# needs to be name syncthingg.nix i may or may not did something weird with git
{ config, pkgs, settings, ... }:

{
  services = {
    syncthing = {
      enable = true;
      user = "josef";
      dataDir = "/home/josef/Documents/Synced";
      configDir = "/home/josef/Documents/Synced/.config/syncthing";
      overrideDevices =
        false; # overrides any devices added or deleted through the WebUI
      overrideFolders =
        false; # overrides any folders added or deleted through the WebUI
      settings = {
        devices = {
          "matteo-nixos" = { id=""};
        };
        folders = {
          "Documents/Synced" =
            { # Folder ID in Syncthing, also the name of folder (label) by default
              label = "Schule";
              path =
                "/home/josef/Documents/Synced"; 
                devices = ["matteo-nixos"]
            };
        };
      };
    };
  };

  # Disable default folder
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";

  # Ports for Syncthing
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
