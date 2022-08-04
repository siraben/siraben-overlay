{ lib, stdenv, fetchFromGitHub, meson, ninja, cmake, pkg-config, tinyxml-2, hyphen, gtk4 }:

stdenv.mkDerivation rec {
  pname = "chapterizer";
  version = "unstable-2022-08-04";

  src = fetchFromGitHub {
    owner = "jpakkane";
    repo = "chapterizer";
    rev = "efe5d1d4246eb0e07046c5adfda62405319f4fa0";
    sha256 = "sha256-+VrCnPGIdM3o3MzRAw59sPfi2sur0uX4c6+hB4yxpgI=";
  };

  nativeBuildInputs = [ meson ninja cmake pkg-config ];
  buildInputs = [ hyphen gtk4 tinyxml-2 ];
  postInstall = ''
    install -Dm755 -t $out/bin guitool
  '';

  meta = with lib; {
    description = "A GUI app for full chapter text alignment";
    homepage = "https://github.com/jpakkane/chapterizer";
    license = licenses.asl20;
    maintainers = with maintainers; [ siraben ];
    platforms = platforms.unix;
    broken = stdenv.isDarwin;
    mainProgram = "guitool";
  };
}
