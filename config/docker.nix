{pkgs, config, inputs, ...}: {
  environment.systemPackages = with pkgs; {
    docker
    docker-compose
    docker-init
  };
};
