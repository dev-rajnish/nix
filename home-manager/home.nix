{
  lib,
  username,
  home-version,
  ...
}:
# SINGLE FOLDER
/*
let
  folder = ./modules;
  toImport = name: value: folder + ("/" + name);
  filterCaches = key: value: value == "regular" && lib.hasSuffix ".nix" key;
  imports = lib.mapAttrsToList toImport (lib.filterAttrs filterCaches (builtins.readDir folder));
in
{
  inherit imports;
*/
#MULTIPLE FOLDERS
let
  folders = [
    ./modules
    ./pkgs
  ];

  readNixFilesFrom = folder: let
    dir = builtins.readDir folder;
    filterCaches = key: value: value == "regular" && lib.hasSuffix ".nix" key;
    toImport = name: _: folder + ("/" + name);
  in
    lib.mapAttrsToList toImport (lib.filterAttrs filterCaches dir);
  imports = lib.flatten (map readNixFilesFrom folders);
in {
  imports = imports;

  programs.home-manager.enable = true;

  home = {
    stateVersion = "${home-version}";
    username = "${username}";
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = "nvim";
      SHELL = "fish";
    };
  };

  systemd.user.startServices = "sd-switch";
}
