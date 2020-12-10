self: super:

{
  bootstrap-scheme = super.callPackage ./bootstrap-scheme { };
  c4 = super.callPackage ./c4 { };
  collapseos = super.callPackage ./collapseos { };
  jonesforth = super.callPackage ./jonesforth { };
  mescc-tools-seed = super.callPackage ./mescc-tools-seed { };
  micro-lisp = super.callPackage ./micro-lisp { };
  s9fes = super.callPackage ./s9fes { };
  ti84-forth = super.callPackage ./ti84-forth { };
  zkeme80 = super.callPackage ./zkeme80 { };
}
