{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
    deno
    vscodium
    android-tools

    fossil
  ];
}
