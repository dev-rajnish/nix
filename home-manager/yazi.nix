{
  config,
  pkgs,
  ...
}: {
  programs.yazi.enableFishIntegration = true;

  programs.yazi.package = pkgs.yazi;

  programs.yazi.enable = true;

  programs.yazi.settings = {
    log = {
      enabled = false;
    };

    manager = {
      show_hidden = true;
      sort_by = "natural";
      sort_dir_first = true;
      sort_reverse = false;
    };
  };
}
