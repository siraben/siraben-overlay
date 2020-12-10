{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "jonesforth";
  src = fetchFromGitHub {
    owner = "nornagon";
    repo = name;
    rev = "4f853252f715132e7716cbd44e5306cefb6a6fec";
    sha256 = "1ns2s1dpxpqi3gqfz2km7dzpnp2xh5din7p3dvbp9p244camr534";
  };
  installPhase = ''
    mkdir -p $out/bin $out/share
    cp jonesforth $out/bin
    cp jonesforth.f $out/share
  '';
  # TODO: write shell wrapper
}
