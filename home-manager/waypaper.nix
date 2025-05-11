{
  config,
  pkgs,
  ...
}:
#  hyprpanel
{
  home.packages = with pkgs; [
    waypaper
  ];

  home.file.".config/waypaper/config.ini".text = ''
    [Settings]
    language = en
    folder = ~/walls
    monitors = All
    wallpaper = ~/walls/981849.png
    backend = swww
    fill = fill
    sort = name
    color = #000000
    subfolders = True
    show_hidden = False
    show_gifs_only = False
    post_command = pkill waypaper
    number_of_columns = 3
    swww_transition_type = any
    swww_transition_step = 200
    swww_transition_angle = 0
    swww_transition_duration = 1.2
    swww_transition_fps = 60
    use_xdg_state = False
  '';
}
