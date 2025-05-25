{
  programs.wezterm.enable = true;

  programs.wezterm.extraConfig =
    # lua
    ''
      return {
         hide_tab_bar_if_only_one_tab = true,
        warn_about_missing_glyphs=false,
      }
    '';
}
