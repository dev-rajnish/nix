{
  pkgs,
  nixvim,
  ...
}: {
  home.packages = with pkgs; [
    nixvim.packages.x86_64-linux.default
    vim

    nodejs
    deno
    vscodium
    android-tools

    fossil
  ];
}
