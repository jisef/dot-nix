{pkgs, config, inputs, ...}: {

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    podman
  ];

  /*home-manager.users.josef = {
    programs.docker = {
       enable = true;
    };
  };*/

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  virtualisation.podman.enable = true;
  virtualisation.docker.enable = true;

  # start containers with : sudo systemctl start "docker-<name>""
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      "mysql-school" = {
        image = "mysql:latest";
        autoStart = false;
        ports = [ "3306:3306" ];
        environment = {
          MYSQL_ROOT_PASSWORD = "cisco";
          MYSQL_DATABASE = "rootDB";
          MYSQL_USER = "josef";
          MYSQL_PASSWORD = "cisco";
        };
        volumes = [
          "/home/josef/docker/data-mySQL:/var/lib/mysql"
        ];
      };

      "pgsql" = {
        image = "postgres:16.8-alpine3.20";
        autoStart = false;
        ports = [ "5432:5432"];
        environment = {
          POSTGRES_PASSWORD = "cisco";
        };
      };
    };
  };
}

