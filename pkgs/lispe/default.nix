{ lib, stdenv, fetchFromGitHub, boost, gcc, python38, curl }:

stdenv.mkDerivation rec {
  pname = "lispe";
  version = "unstable-2021-02-06";

  src = fetchFromGitHub {
    owner = "naver";
    repo = "lispe";
    rev = "52e0370fd1e980c0bc96553f9ee8bfcd44d0029f";
    sha256 = "sha256-8NukaTFfXAOh3zb+XUVqythStKYDV0y68W3cGDygBaM=";
  };

  nativeBuildInputs = [ gcc python38 ];
  buildInputs = [ boost curl ];

  postPatch = lib.optionalString stdenv.isDarwin ''
    substituteInPlace include/tools.h --replace 'linux/limits.h' 'limits.h'
  '';

  meta = with lib; {
    description = "";
    homepage = "https://github.com/naver/lispe";

    license = licenses.bsd2;
    maintainers = with maintainers; [  ];
    platforms = platforms.unix;
  };
}
