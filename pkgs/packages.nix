self: super:

{
  bootstrap-scheme = super.callPackage ./bootstrap-scheme.nix { };
  c4 = super.callPackage ./c4.nix { };
  collapseos = super.callPackage ./collapseos.nix { };
  jonesforth = super.callPackage ./jonesforth.nix { };
  mescc-tools-seed = super.callPackage ./mescc-tools-seed.nix { };
  micro-lisp = super.callPackage ./micro-lisp.nix { };
  ti84-forth = super.callPackage ./ti84-forth.nix { };
  zkeme80 = super.callPackage ./zkeme80.nix { };
}
