{
  description = "siraben-overlay";
  inputs = {
    nixpkgs.url = "nixpkgs/release-20.09";
    utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        overlay = import ./overlay.nix;
        pkgs = import nixpkgs { inherit system; overlays = [ overlay ]; };
      in {
        inherit overlay pkgs;
        packages = pkgs;
      });
}
