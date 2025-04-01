{ config, pkgs, inputs, ... }: {
  programs.zsh.enable = true;
  home-manager.users.josef = {

        programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        right_format = "$cmd_duration";
        add_newline = false;

        format = ''$directory$hostname$git_branch$git_status
$character'';
        
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[✗](bold red)";
        };

        cmd_duration = {
          min_time = 2;  # Show duration for commands taking longer than 2 seconds
          format = "[⏱ $duration]($style)";
          style = "bold green";
        };

        directory = {
          use_logical_path = true;
          truncation_length = 6;
          home_symbol = "~";
          truncate_to_repo = false;
          style = "bold cyan";
        };

        git_branch = {
          symbol = " ";
          style = "bold purple";
          format = "[$symbol$branch]($style) ";
        };

        git_status = {
          ahead = "⇡";
          behind = "⇣";
          diverged = "⇕";
          modified = "✎";
          deleted = "✖";
          style = "bold yellow";
        };

        hostname = {
          ssh_only = true;
          format = "[on $hostname](bold yellow)";
          disabled = false;
        };
      };
    };
  };
}
