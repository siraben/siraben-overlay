{ stdenv, lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "passerine";
  version = "unstable-2021-02-09";

  src = fetchFromGitHub {
    owner = "vrtbl";
    repo = "passerine";
    rev = "69842e5fcd99b973dbe78df97dc56f78603de8a4";
    sha256 = "sha256-GpAhCL+jLV6O/wpEB8FWhfQ3zHcJcA3KWZuFDfRdHWE=";
  };

  cargoSha256 = "sha256-7J03goXPIcIY4HcM7B3CZeUFXNSBLkZECobIX30Vkaw=";

  meta = with lib; {
    description = "A small extensible programming language designed for concise expression with little code";
    homepage = "https://github.com/vrtbl/passerine";
    license = licenses.mit;
    maintainers = with maintainers; [ siraben ];
  };
}
