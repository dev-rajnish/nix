{
  programs.fish = {
    enable = true;
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
