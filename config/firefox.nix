{ config, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ firefox ];
  home-manager.users.josef = {
    programs.firefox = {
      enable = true;
      languagePacks = [ "en-GB" "de" ];
      profiles.default = {
        bookmarks = {
          force = true;
          settings = [
            {
              name = "cloud";
              # tags = ["sigma"];
              keyword = "ex";
              url = "https://www.icloud.com/";
            }
          ];  
        };
        extensions = with inputs.firefox-addons; [
          
        ];

        settings = {
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "browser.theme.content-theme" = 0;
          "browser.theme.toolbar-theme" = 0;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.system.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.bookmarks.addedImportButton" = false;

          "app.normandy.first_run" = false;
          "app.update.auto" = false;

          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.contentblocking.category" = "standard";        #change !!!
        };
      };
      policies = {
        BlockAboutConfig = true;
        DefaultDownloadDirectory = "/home/josef/Downloads";
        DisableTelemetry = true;
      };
    };
  };
}
