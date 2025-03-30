{ config, pkgs, inputs, ... }: {
  home-manager.users.josef = {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        format = 
''$directory$git_status
$character'';
        add_newline = false;

        character = {
          success_symbol = "[➜](bold green) ";
          error_symbol = "[✗](bold red) ";
        };

        directory = {
          use_logical_path = true;
          truncation_length = 6;
          home_symbol = "~";
          truncate_to_repo = false;
        };

        git_status = {
          format = "$modified";
          modified = ''$count'';

        };

        
      };
    };
  };
}
