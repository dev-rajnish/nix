{
  programs.wezterm = {
    enable = true;
    extraConfig =
      # lua
      ''
        return {
        hide_tab_bar_if_only_one_tab = true,
        warn_about_missing_glyphs=false,
        }
      '';
  };
}
