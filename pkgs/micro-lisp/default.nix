{ lib, stdenv, fetchFromGitHub, libbsd }:

stdenv.mkDerivation rec {
  name = "micro-lisp";

  src = fetchFromGitHub {
    owner = "carld";
    repo = "micro-lisp";
    rev = "faa448de9c7e407ad1d31bb7ec0c10f2367fc736";
    sha256 = "0ignsvn7vhrgyy60nzbjllngrkkc73x19gsyd3fnpa9vkapdsr40";
  };

  buildInputs = [ libbsd ];
  makeFlags = [ "mlisp89-non-bsd" "micro-lisp" ];

  doCheck = stdenv.targetPlatform == stdenv.buildPlatform;

  checkPhase = ''
    patchShebangs ./test.sh
    make test
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp micro-lisp mlisp89 $out/bin
  '';

  meta = {
    description = "A very small Lisp interpreter in under 200 lines of C";
    homepage = "https://github.com/carld/micro-lisp";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}
