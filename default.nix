# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  # my packages
  cf-dns-updater = pkgs.callPackage ./pkgs/cf-dns-updater { };
  i3lock-fancy-rapid = pkgs.callPackage ./pkgs/i3lock-fancy-rapid { };
  polytask = pkgs.callPackage ./pkgs/polytask { };

  # catppuccin
  catppuccin.cursors = pkgs.callPackage ./pkgs/catppuccin/cursors {
    inkscape = pkgs.inkscape;
    xorg = pkgs.xorg;
  };
  catppuccin.gtk = pkgs.callPackage ./pkgs/catppuccin/gtk { };

  # other packages
  glide = pkgs.callPackage ./pkgs/glide { };
  hbs = pkgs.callPackage ./pkgs/hbs { };
  linx-client = pkgs.callPackage ./pkgs/linx-client { };
  linx-server = pkgs.callPackage ./pkgs/linx-server {
    go-rice = pkgs.callPackage ./pkgs/go-rice { };
  };
  papermc = pkgs.callPackage ./pkgs/papermc { };
  ts3exporter = pkgs.callPackage ./pkgs/ts3exporter { };
}
