{ config, pkgs, settings, ... }:

{
  services = {
  syncthing = {
    enable = true;
    user = "josef";
    dataDir = "/home/josef/Documents/Synced";
    configDir = "/home/josef/Documents/Synced/.config/syncthing";
    overrideDevices = false;     # overrides any devices added or deleted through the WebUI
    overrideFolders = false;     # overrides any folders added or deleted through the WebUI
    settings = {     
      folders = {
        "Documents/Synced" = {                    # Folder ID in Syncthing, also the name of folder (label) by default
          label = "Schule";
          path = "/home/josef/Documents/Synced";    # Which folder to add to Syncthing
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
