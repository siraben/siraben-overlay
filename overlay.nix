final: prev:

let
  callPackage = prev.callPackage;
in
{
  almost-ti = callPackage ./pkgs/almost-ti { };
  attoforth = callPackage ./pkgs/attoforth { };
  blynn = callPackage ./pkgs/blynn { };
  bootstrap-scheme = callPackage ./pkgs/bootstrap-scheme { };
  c4 = callPackage ./pkgs/c4 { };
  collapseos = callPackage ./pkgs/collapseos { };
  double-pendulum-simulation = prev.haskellPackages.callPackage ./pkgs/double-pendulum-simulation { };
  essentials-of-compilation = callPackage ./pkgs/essentials-of-compilation { };
  ezengine = callPackage ./pkgs/ezengine { };
  fe = callPackage ./pkgs/fe { };
  git2graph = callPackage ./pkgs/git2graph { };
  jonesforth = callPackage ./pkgs/jonesforth { };
  koka = prev.haskellPackages.callPackage ./pkgs/koka { };
  lang-narrow = prev.ocamlPackages.callPackage ./pkgs/lang-narrow { };
  mes = callPackage ./pkgs/mes { };
  mescc-tools-seed = callPackage ./pkgs/mescc-tools-seed { };
  micro-lisp = callPackage ./pkgs/micro-lisp { };
  nix-hello = callPackage ./pkgs/nix-hello { };
  nix-hello-minimal = callPackage ./pkgs/nix-hello-minimal { };
  ostools = callPackage ./pkgs/ostools { };
  oxide = callPackage ./pkgs/oxide { };
  passerine = callPackage ./pkgs/passerine { };
  regenkfs = callPackage ./pkgs/regenkfs { };
  remarkable-linux-client = prev.qt5.callPackage ./pkgs/remarkable-linux-client { };
  remkrom = callPackage ./pkgs/remkrom { };
  rmview = prev.libsForQt5.callPackage ./pkgs/rmview { };
  s9fes = callPackage ./pkgs/s9fes { };
  stage0 = callPackage ./pkgs/stage0 { };
  the-powder-toy = callPackage ./pkgs/the-powder-toy { inherit (prev) the-powder-toy; };
  ti84-forth = callPackage ./pkgs/ti84-forth { };
  tz = callPackage ./pkgs/tz { };
  twin = callPackage ./pkgs/twin { };
  urscheme = callPackage ./pkgs/urscheme { };
  zkeme80 = callPackage ./pkgs/zkeme80 { };
}
