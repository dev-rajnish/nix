{
  programs.fish = {
    enable = true;
    shellAliases = {
      gs = "git status";
      vim = "nvim";
      ll = "ls -alF";
      h = "Hyprland";
      wifi-connect = "nmcli -a d wifi connect $1";
    };
    shellInit =
      # py
      ''
        set -g fish_greeting ""
        nerdfetch
      '';
  };
  programs.starship.enable = true;
  programs.starship.enableTransience = true;
  programs.starship.enableFishIntegration = true;
}
