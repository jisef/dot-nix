{config, pkgs, inputs, ...}: {
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-GB" "de"];
    profiles.default = {
      settings = {
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "browser.theme.content-theme" = 0;
        "browser.theme.toolbar-theme" = 0;
      };
    };
    policies = {
      BlockAboutConfig = true;
      DefaultDownloadDirectory = "/home/josef/Downloads";
      DisableTelemetry = false;
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      };
    };
  };  
};
