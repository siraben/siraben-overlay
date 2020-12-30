{ stdenvNoCC, fetchurl, coreutils, gnutar, gzip, patch, gnumake, bash, gnused, gnugrep }:

rec {

  mesBoot0 = fetchurl {
    url = "https://alpha.gnu.org/gnu/guix/bootstrap/i686-linux/20181020/mes-minimal-stripped-0.18-0.08f04f5-i686-linux.tar.xz";
    sha256 = "0qwpby91hp6afmg5ibdrrk3fw85zxdazfk7rhrdsihsfzqwmfhfx";
  };

  mesccToolsBoot = fetchurl {
    url = "https://alpha.gnu.org/gnu/guix/bootstrap/i686-linux/20181020/mescc-tools-static-0.5.2-0.bb062b0-i686-linux.tar.xz";
    sha256 = "11lniw0vg61kmyhvnwkmcnkci9ym6hbmiksiqggd0hkipbq7hvlz";
  };

  guileBoot = fetchurl {
    url = "https://alpha.gnu.org/gnu/guix/bootstrap/i686-linux/20131110/guile-2.0.9.tar.xz";
    sha256 = "0im800m30abgh7msh331pcbjvb4n02smz5cfzf1srv0kpx3csmxp";
  };

  unpacked = stdenvNoCC.mkDerivation {
    name = "test";

    buildCommand = ''
      mkdir $out
      cd $out

      tar xf ${mesBoot0}
      chmod -R u+w .
      tar xf ${mesccToolsBoot}
      chmod -R u+w .
      tar xf ${guileBoot}
      chmod -R u+w .

      bin/hex2 --help
      bin/guile --help
    '';
    meta.platforms = [ "i686-linux" ];
  };

  tinyccSrc = let commit = "c7b3f59d1a71e71b470f859b20f0cfe840f3954d"; in
    fetchurl {
      url = "https://gitlab.com/janneke/tinycc/-/archive/${commit}/tinycc-${commit}.tar.gz";
      sha256 = "1agz5w5q6dm51n63hsxii33hxdghmdiacbb5zzxzac3aarfxjb2m";
    };

  nyaccSrc = fetchurl {
    url = "http://download.savannah.gnu.org/releases/nyacc/nyacc-0.86.0.tar.gz";
    sha256 = "0lkd9lyspvhxlfs0496gsllwinh62jk9wij6gpadvx9gwz6yavd9";
  };

  mesSrc = fetchurl {
    url = "https://git.savannah.gnu.org/cgit/mes.git/snapshot/mes-08f04f559670d9e8f57eb03bb9b13f4d0b81cedf.tar.gz";
    sha256 = "1b7wz9k38pfrz707pd4p8s54q903jr167q73ya7qkna89sxj3wna";
  };

  nyaccPatch = ./nyacc-binary-literals.patch;

  mesBoot = stdenvNoCC.mkDerivation {
    name = "mes-boot-0";

    GUILE_TOOLS = "true";
    #GUILE_LOAD_PATH = "nyacc";
    MES_SEED = "${unpacked}/lib";
    #MES = "guile";
    #V = 2;

    propagatedBuildInputs = [ unpacked coreutils gnutar gzip patch gnumake bash gnused ];

    unpackPhase = ''
      tar xf ${mesSrc}
      cd mes-08*
    '';

    configurePhase = ''
      ./configure.sh --prefix=$out
    '';

    buildPhase = ''
      sh ./build.sh
    '';

    doCheck = false;

    checkPhase = ''
      rm tests/srfi-9.test
      rm tests/srfi-43.test
      sh ./check.sh
    '';

    installPhase = ''
      cp src/mes.S.blood-elf src/mes.S
      sh ./install.sh
    '';

    fixupPhase = ":";
    meta.platforms = [ "i686-linux" ];
  };

  tinycc0 = stdenvNoCC.mkDerivation {
    name = "tinycc";

    MES = "guile";
    MES_PREFIX = "mes";

    C_INCLUDE_PATH = "${mesBoot}/share/mes/include";

    ONE_SOURCE = 1;
    PREPROCESS = 1;

    nativeBuildInputs = [ mesBoot ];

    unpackPhase = ''
      ln -s ${unpacked}/lib mes-seed

      export PATH=${mesBoot}/bin:${unpacked}/bin:${coreutils}/bin:${gnutar}/bin:${gzip}/bin:${patch}/bin:${gnumake}/bin:${bash}/bin:${gnugrep}/bin

      tar xvf ${nyaccSrc}
      mv nyacc-* nyacc-source
      cd nyacc-source
      patch -p1 ${nyaccPatch}
      cd ..

      tar xvf ${tinyccSrc}
      cd tinycc-*

      ln -s ${mesBoot}/share/mes mes
    '';

    configurePhase = ''
      export GUILE_LOAD_PATH=${unpacked}/share/guile/2.0:$TMPDIR/nyacc-source/module
      ./configure --prefix=$out --crtprefix=. --tccdir=.
      export PREFIX=$out
    '';

    buildPhase = ''
      ./build.sh
    '';

    installPhase = ''
      ./install.sh
    '';

    fixupPhase = ":";
    meta.platforms = [ "i686-linux" ];
  };

}
