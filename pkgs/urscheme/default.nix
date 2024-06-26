{ lib, stdenv, coreutils, fetchurl, guile }:

stdenv.mkDerivation rec {
  pname = "urscheme";
  version = "3";

  src = fetchurl {
    url = "http://www.canonical.org/~kragen/sw/urscheme/urscheme-${version}.tar.gz";
    sha256 = "sha256-GWrVdlhOpJ0Ix9ojovv/rMH3OtvzvwoqcIRzVrL82R0=";
  };

  nativeBuildInputs = [ guile ];
  preBuild = ''
    patchShebangs runtests
    substituteInPlace runtests --replace "/bin/rm" "${coreutils}/bin/rm"
  '';

  meta = with lib; {
    description = "";
    homepage = "http://www.canonical.org/~kragen/sw/urscheme/";

    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ siraben ];
    platforms = platforms.linux;
  };
}
