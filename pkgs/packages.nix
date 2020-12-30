self: super:

let
  callPackage = super.callPackage;
in
{
  almost-ti = callPackage ./almost-ti { };
  blynn = callPackage ./blynn { };
  bootstrap-scheme = callPackage ./bootstrap-scheme { };
  c4 = callPackage ./c4 { };
  cakelisp = callPackage ./cakelisp { };
  collapseos = callPackage ./collapseos { };
  double-pendulum-simulation = super.haskellPackages.callPackage ./double-pendulum-simulation { };
  git2graph = callPackage ./git2graph { };
  jonesforth = callPackage ./jonesforth { };
  mes = callPackage ./mes { };
  mescc-tools-seed = callPackage ./mescc-tools-seed { };
  micro-lisp = callPackage ./micro-lisp { };
  oberon-risc-emu = callPackage ./oberon-risc-emu { };
  ostools = callPackage ./ostools { };
  oxide = callPackage ./oxide { };
  regenkfs = callPackage ./regenkfs { };
  remarkable-linux-client = super.qt5.callPackage ./remarkable-linux-client { };
  remkrom = callPackage ./remkrom { };
  rmview = callPackage ./rmview { };
  s9fes = callPackage ./s9fes { };
  stage0 = callPackage ./stage0 { };
  ti84-forth = callPackage ./ti84-forth { };
  twin = callPackage ./twin { };
  zkeme80 = callPackage ./zkeme80 { };
}
