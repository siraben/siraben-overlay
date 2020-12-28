{ sources ? import ./nix/sources.nix { }
, pkgs ? import sources.nixpkgs { }
, system ? builtins.currentSystem
}:
let
  # Nixpkgs extended with bootstrappable related packages
  siraben-pkgs = import ./pkgs { inherit system; };
in
siraben-pkgs
