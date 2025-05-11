{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    fossil
    swww
    wl-clipboard
    cliphist
    nwg-clipman
    clipman
    llama-cpp
    lmstudio
  ];
}
