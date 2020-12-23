{ stdenv, lib, fetchFromGitHub, gcc }:

stdenv.mkDerivation rec {
  name = "stage0";
  src = fetchFromGitHub {
    owner = "OriansJ";
    repo = name;
    rev = "038b2d793d7f41272d026bb9e4b03b93ab724531";
    sha256 = "0sl1zl40ijzm6p0sk68lgxfj3yd6vcbh707c54rmwq4g7v3hfrfl";
    fetchSubmodules = true;
  };
  patchPhase = lib.optionals stdenv.isDarwin ''
    substituteInPlace makefile --replace 'soname' 'install_name'
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp bin/* $out/bin
    cp prototypes/* $out/bin
  '';
  nativeBuildInputs = lib.optionals stdenv.isDarwin [ gcc ];
  hardeningDisable = [ "all" ];
  meta = with lib; {
    description = "stage0";
    platform = platforms.linux;
    maintainers = [ maintainers.siraben ];
    license = licenses.gpl3Plus;
  };
}
