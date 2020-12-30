{ stdenv, fetchFromGitHub, zlib, libX11, libXpm, ncurses }:

stdenv.mkDerivation rec {
  pname = "twin";
  version = "unstable-2020-12-30";

  src = fetchFromGitHub {
    owner = "cosmos72";
    repo = "twin";
    rev = "42dbfae36fe0aea487a3bed70d91f384d5e117eb";
    sha256 = "0ni2d3k4vqwj704d6fnj7k649qwbxb96z1lal2yppszksiva3vms";
  };

  buildInputs = [ zlib libX11 libXpm ncurses ];
  hardeningDisable = [ "all" ];
  
}
