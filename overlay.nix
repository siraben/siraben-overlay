final: prev:

let
  callPackage = prev.callPackage;
in
{
  acme = callPackage ./pkgs/acme { };
  algebraic = callPackage ./pkgs/algebraic { };
  almost-ti = callPackage ./pkgs/almost-ti { };
  antic = callPackage ./pkgs/antic { };
  archivebox = prev.python3Packages.callPackage ./pkgs/archivebox { };
  attoforth = callPackage ./pkgs/attoforth { };
  blynn = callPackage ./pkgs/blynn { };
  bootstrap-scheme = callPackage ./pkgs/bootstrap-scheme { };
  c4 = callPackage ./pkgs/c4 { };
  c64-non-sense = callPackage ./pkgs/c64-non-sense { };
  cistercian = callPackage ./pkgs/cistercian { };
  calcium = callPackage ./pkgs/calcium { };
  cc65 = callPackage ./pkgs/cc65 { };
  collapseos = callPackage ./pkgs/collapseos { };
  double-pendulum-simulation = prev.haskellPackages.callPackage ./pkgs/double-pendulum-simulation { };
  essentials-of-compilation = callPackage ./pkgs/essentials-of-compilation { };
  ezengine = callPackage ./pkgs/ezengine { };
  fe = callPackage ./pkgs/fe { };
  flint = callPackage ./pkgs/flint { };
  git2graph = callPackage ./pkgs/git2graph { };
  jonesforth = callPackage ./pkgs/jonesforth { };
  lang-narrow = prev.ocamlPackages.callPackage ./pkgs/lang-narrow { };
  mes = callPackage ./pkgs/mes { };
  mescc-tools-seed = callPackage ./pkgs/mescc-tools-seed { };
  micro-lisp = callPackage ./pkgs/micro-lisp { };
  morsel = callPackage ./pkgs/morsel { };
  nix-hello = callPackage ./pkgs/nix-hello { };
  nix-hello-minimal = callPackage ./pkgs/nix-hello-minimal { };
  ostools = callPackage ./pkgs/ostools { };
  oxide = callPackage ./pkgs/oxide { };
  regit = callPackage ./pkgs/regit { };
  remarkable-linux-client = prev.qt5.callPackage ./pkgs/remarkable-linux-client { };
  rmview = prev.libsForQt5.callPackage ./pkgs/rmview { };
  stage0 = callPackage ./pkgs/stage0 { };
  ti84-forth = callPackage ./pkgs/ti84-forth { };
  twin = callPackage ./pkgs/twin { };
  urscheme = callPackage ./pkgs/urscheme { };
  zkeme80 = callPackage ./pkgs/zkeme80 { };
}
