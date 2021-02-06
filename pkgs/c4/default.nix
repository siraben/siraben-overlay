{ stdenv, lib, fetchFromGitHub, gcc }:

stdenv.mkDerivation rec {
  name = "c4";
  src = fetchFromGitHub {
    owner = "rswier";
    repo = name;
    rev = "2feb8c0a142b2e513be69442c24af82dbaf41a25";
    sha256 = "0rqaycq6fdl3r870bzba2cj4y7n34xxfzyvizbqg83s2r27vhqf3";
  };

  nativeBuildInputs = lib.optional stdenv.isDarwin gcc;

  buildPhase = ''
    gcc -o c4 c4.c
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp c4 $out/bin
  '';

  meta = with lib; {
    description = "C in four functions";
    homepage = "https://github.com/rswier/c4";
    license = licenses.gpl2;
    platforms = platforms.all;
  };
}
