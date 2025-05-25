{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    nwg-clipman
    #clipman
  ];
}
