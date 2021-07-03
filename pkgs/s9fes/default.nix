{ stdenv, lib, fetchurl, ncurses, buildPackages }:

let
  isCrossCompiling = stdenv.hostPlatform != stdenv.buildPlatform;
in

stdenv.mkDerivation rec {
  pname = "s9fes";
  version = "unstable-2018-12-05";

  src = fetchurl {
    url = "http://www.t3x.org/s9fes/s9fes-20181205.tgz";
    sha256 = "1jd9brg6djxy3kdaw80hpvc557q4w2cjsry064kgkn3js4n6wbg9";
  };

  # Fix cross-compilation
  postPatch = ''
    substituteInPlace Makefile --replace 'ar q' '${stdenv.cc.targetPrefix}ar q'
    substituteInPlace Makefile --replace 'strip' '${stdenv.cc.targetPrefix}strip'
    ${lib.optionalString isCrossCompiling "substituteInPlace Makefile --replace ./s9 '${buildPackages.s9fes}/bin/s9'"}
  '';

  buildInputs = [ ncurses ];
  makeFlags = [ "CC=${stdenv.cc.targetPrefix}cc" "PREFIX=$(out)" ];
  enableParallelBuilding = true;

  meta = with lib; {
    description = "Scheme 9 From Empty Space";
    homepage = "http://www.t3x.org/s9fes/index.html";
    license = licenses.publicDomain;
    maintainers = with maintainers; [ siraben ];
    platforms = platforms.unix;
  };
}
