{ config, inputs, pkgs, ... }: {
  nix.settings = {
    substituters =
      [ "https://walker-git.cachix.org" "https://walker.cachix.org" ];
    trusted-public-keys = [
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
    ];
  };
  environment.systemPackages = with pkgs; [ gtk4-layer-shell ];
  services.displayManager.defaultSession = "hyprland";
  home-manager.users.josef = {
    imports = [ inputs.walker.homeManagerModules.default ];
    programs.walker = {
      enable = true;
      runAsService = false;
      config = {
        search.placeholder = "Search";
        list = { height = 200; };
        websearch.prefix = "?";
        switcher.prefix = "/";
        #       theme = "nixos";
      };
      # All options from the config.json can be used here.
      # If this is not set the default styling is used.
    };
  };
}
