{
  description = "My personal NUR repository";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.paste.url = "git+ssh://ouzu.tech/paste";
  outputs = { self, nixpkgs, paste }:
    let
      systems = [
        "x86_64-linux"
        "i686-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "armv6l-linux"
        "armv7l-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in
    {
      devShell = forAllSystems (system: pkgs.callPackage ./shell.nix {
        pkgs = import nixpkgs { inherit system; };
      });
      packages = forAllSystems (system: import ./default.nix {
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            paste.overlay.${system}
          ];
        };
      });
    };
}
