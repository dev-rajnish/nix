{...}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      gs = "git status";
      vim = "nvim";
      edit = "nvim (fzf)";
      e = "edit";
      #ls = "ls -a1";
      #ll = "ll -al";
      h = "Hyprland";
      y = "yy";
      x = "clear";
      wifi-connect = "nmcli -a d wifi connect $1";
    };
    shellInit =
      # py
      ''
        set -g fish_greeting ""
        nerdfetch
      '';
    functions = {
      __fish_command_not_found_handler = {
        body = ''
          __fish_default_command_not_found_handler $argv[1]
          fuck
        '';
        onEvent = "fish_command_not_found";
      };
    };
  };

  programs.fzf.enableFishIntegration = true;
  programs.fzf.enable = true;

  programs.thefuck.enableFishIntegration = true;
  programs.thefuck.enableInstantMode = true;
  programs.thefuck.enable = true;

  programs.starship.enable = true;
  programs.starship.enableTransience = true;
  programs.starship.enableFishIntegration = true;

  programs.eza.colors = "always";
  programs.eza.enableFishIntegration = true;
  programs.eza.enable = true;
  programs.eza.extraOptions = [
    "--group-directories-first"
    "--header"
  ];
  programs.eza.git = true;
  programs.eza.icons = "always";
}
