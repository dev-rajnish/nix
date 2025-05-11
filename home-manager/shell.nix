{
  programs.fish = {
    enable = true;
    shellAliases = {
      gs = "git status";
      vim = "nvim";
      ll = "ls -alF";
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
        body = "__fish_default_command_not_found_handler $argv[1]";
        onEvent = "fish_command_not_found";
      };
    };
  };
  programs.starship.enable = true;
  programs.starship.enableTransience = true;
  programs.starship.enableFishIntegration = true;
}
