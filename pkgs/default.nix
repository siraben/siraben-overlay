{ sources ? import ../nix/sources.nix, pkgs ? import sources.nix, system }:

import sources.nixpkgs {
  inherit system;
  overlays = [ (import ./packages.nix) ];
}
