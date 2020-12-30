{ stdenv, fetchFromGitHub, SDL2 }:

stdenv.mkDerivation rec {
  pname = "oberon-risc-emu";
  version = "untable-2020-08-18";

  buildInputs = [ SDL2 ];

  src = fetchFromGitHub {
    owner = "pdewacht";
    repo = pname;
    rev = "26c8ac5737c71811803c87ad51f1f0d6e62e71fe";
    sha256 = "1iriix3cfcpbkjb5xjb4ysh592xppgprwzp3b6qhwcx44g7kdvxq";
  };

  installPhase = ''
    install -Dm755 risc -t $out/bin
  '';
}
