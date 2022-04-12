{ lib, stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl, Security, AppKit }:

rustPlatform.buildRustPackage rec {
  pname = "zee";
  version = "unstable-2022-04-11";

  src = fetchFromGitHub {
    owner = "mcobzarenco";
    repo = "zee";
    rev = "a8979be0819a7140648315c1e5fac052933f9b57";
    sha256 = "sha256-qCslkvur8aHAveYsX9i7DGpqySbVr4uOHDh3G/VnCco=";
    fetchSubmodules = true;
  };

  cargoSha256 = "sha256-R8fYeZhEKracVAUvPsw690ZngKzncCarq0arfD8ZPyM=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ lib.optionals stdenv.isDarwin [ Security AppKit ];

  meta = with lib; {
    description = "A modern text editor for the terminal";
    homepage = "https://github.com/mcobzarenco/zee";
    license = licenses.asl20;
    maintainers = with maintainers; [ siraben ];
  };
}
