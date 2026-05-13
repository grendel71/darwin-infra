{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = true;
      scan_timeout = 5;
      command_timeout = 500;

      format = ''
        [┌───](bold bright-blue) $hostname $os
        [│](bold bright-blue) $directory$git_branch$git_status$nix_shell
        [└─>](bold bright-blue) $character
      '';

      os = {
        format = "on [($name $codename$version $symbol )]($style)";
        style = "bold bright-blue";
        disabled = false;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style)";
        style = "bold bright-red";
        disabled = false;
      };

      character = {
        format = "$symbol";
        success_symbol = "[❯](bold bright-green) ";
        error_symbol = "[✗](bold bright-red) ";
        vicmd_symbol = "[](bold yellow) ";
        disabled = false;
      };

      nix_shell = {
        disabled = false;
        heuristic = false;
        format = "[   ](fg:bright-blue bold)";
        impure_msg = "";
        pure_msg = "";
        unknown_msg = "";
      };

      aws.disabled = true;
      gcloud.disabled = true;
      nodejs.disabled = true;
      ruby.disabled = true;
      python.disabled = true;
      rust.disabled = true;
      golang.disabled = true;
      java.disabled = true;
      kotlin.disabled = true;
      lua.disabled = true;
      perl.disabled = true;
      php.disabled = true;
      swift.disabled = true;
      terraform.disabled = true;
      zig.disabled = true;
      package.disabled = true;
      conda.disabled = true;
      docker_context.disabled = true;
      kubernetes.disabled = true;
      helm.disabled = true;
      battery.disabled = true;
      time.disabled = true;
      cmd_duration.disabled = true;
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if test "$TERM" = "xterm-kitty"
        alias ssh="env TERM=xterm-256color ssh"
      end
    '';
    functions = {
      sysinfo = {
        description = "Display system information";
        body = ''
          echo "System Information:"
          echo "=================="
          echo "Hostname: "(hostname)
          echo "User: "$USER
          echo "OS: "(uname -s)
          echo "Kernel: "(uname -r)
          echo "Uptime: "(uptime | awk '{print $3" "$4" "$5}' | sed 's/,//')
          echo "Memory: "(vm_stat | awk '/Pages active/ {a=$3} /Pages wired/ {w=$3} END {printf "%.1f GB used\n", (a+w)*4096/1073741824}')
          echo "Disk Usage: "(df -h / | tail -1 | awk '{print $5" used"}')
        '';
      };
      please = {
        description = "Run command with sudo";
        body = "sudo $argv";
      };
      rebuild = {
        description = "Rebuild darwin system configuration";
        body = "darwin-rebuild switch --flake $HOME/darwin-infra/";
      };
      osync = {
        description = "Sync vault";
        body = "nix develop $HOME/syncVault/ --command bash -c 'cd $HOME/syncVault && python $HOME/syncVault/sync.py'";
      };
    };
    shellAliases = {
      please = "sudo";
      rebuild = "darwin-rebuild switch --flake $HOME/darwin-infra/";
      osync = "nix develop $HOME/syncVault/ --command bash -c 'cd $HOME/syncVault && python $HOME/syncVault/sync.py'";
    };
  };
}
