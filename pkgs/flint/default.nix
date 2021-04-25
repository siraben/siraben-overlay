{ lib
, stdenv
, fetchFromGitHub
, gmp
, mpir
, mpfr
, ntl
, openblas, blas, lapack
, withBlas ? true
}:

assert withBlas -> openblas != null && blas.implementation == "openblas" && lapack.implementation == "openblas";

stdenv.mkDerivation rec {
  pname = "flint";
  version = "2.7.1";
  src = fetchFromGitHub {
    owner = "wbhart";
    repo = "flint2";
    rev = "v${version}";
    sha256 = "sha256-AhpMAAaq4zPvUOF9KLGP+wB6MVWmPXuDHI1SykuGNRc=";
  };
  buildInputs = [
    gmp
    mpir
    mpfr
    ntl
  ] ++ lib.optionals withBlas [
    openblas
  ];
  propagatedBuildInputs = [
    mpfr # flint.h includes mpfr.h
  ];
  configureFlags = [
    "--with-gmp=${gmp}"
    "--with-mpir=${mpir}"
    "--with-mpfr=${mpfr}"
    "--with-ntl=${ntl}"
  ] ++ lib.optionals withBlas [
    "--with-blas=${openblas}"
  ];

  # issues with ntl -- https://github.com/wbhart/flint2/issues/487
  NIX_CXXSTDLIB_COMPILE = "-std=c++11";

  enableParallelBuilding = true;

  doCheck = true;
  meta = {
    inherit version;
    description = "Fast Library for Number Theory";
    license = lib.licenses.gpl2Plus;
    maintainers = [lib.maintainers.raskin];
    platforms = lib.platforms.unix;
    homepage = "http://www.flintlib.org/";
    downloadPage = "http://www.flintlib.org/downloads.html";
    updateWalker = true;
  };
}
