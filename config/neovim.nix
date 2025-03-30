{pkgs, config, inputs, ...}: {
  environment.systemPackages = with pkgs; {
    neovim
  };
};
