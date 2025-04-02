{config, pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [ cliphist ];
  home-manager.users.josef = {
    services.cliphist = {
      enable = true;
    };
  };
}
