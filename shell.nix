{ mkShell
, pkgs
}:

mkShell {
  nativeBuildInputs = with pkgs; [
    nixpkgs-fmt
  ];
}
