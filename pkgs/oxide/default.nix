{ stdenv, fetchFromGitHub, qt512, remarkable-toolchain }:

stdenv.mkDerivation {
  name = "oxide";
  src = fetchFromGitHub {
    owner = "Eeems";
    repo = "oxide";
    # on v2.1 branch
    rev = "bf8ed66cfce7fb579ca8eb72ab1e38b3cf25cec4";
    sha256 = "1bzpfwwhpgcirb748n9ca81f29jr5r034rfa5nihhwlzb58r6wsk";
  };
  nativeBuildInputs = [ qt512.full remarkable-toolchain ];
  buildPhase = ''
    source ${remarkable-toolchain}/environment-setup-cortexa9hf-neon-oe-linux-gnueabi
    make release -j$NIX_BUILD_CORES
  '';
  installPhase = ''
    cp -r release/. $out
  '';
  meta = with stdenv.lib; {
    description = " A launcher application for the reMarkable tablet ";
    platform = [ "x86_64-linux" ];
    maintainers = [ maintainers.siraben ];
    license = licenses.mit;
  };
}
