{
  config,
  pkgs,
  stylix,
  ...
}: {
  stylix.enable = true;
  stylix.autoEnable = true;

  # helios, jabuti, tender, darkmoss, codeschool
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/helios.yaml";

  #stylix.image = ./gruv-astro.png;

  #stylix.targets.swaync.enable = true;

  #stylix.targets.kitty.variant256Colors = true;

  stylix.opacity.terminal = 0.90;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.package = pkgs.bibata-cursors;

  stylix.cursor.size = 32;

  stylix.polarity = "dark";

  stylix.fonts.sizes.terminal = 12;

  stylix.fonts.emoji = {
    name = "Noto Color Emoji";
    package = pkgs.noto-fonts-color-emoji;
  };

  stylix.fonts.monospace = {
    name = "Noto Sans Mono";
    package = pkgs.noto-fonts;
  };

  stylix.fonts.serif = {
    name = "Noto Serif";
    package = pkgs.noto-fonts;
  };

  stylix.fonts.sansSerif = {
    name = "Noto Sans";
    package = pkgs.noto-fonts;
  };
}
# ╭──────────────────────────────────────────────────────────╮
# │ stylix-end                                               │
# ╰──────────────────────────────────────────────────────────╯

