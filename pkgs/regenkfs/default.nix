{ stdenv, lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "regenkfs";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "siraben";
    repo = pname;
    rev = "652155445fc39bbe6628f6b9415b5cd6863f592f";
    sha256 = "19hvxx9cbn13hsykdqfqwq2sjhlm3g7xcr9dzxkwn6jgqfj0wk6f";
  };

  cargoSha256 = "sha256-zIBlNa3tsNpbG2BMrQ6FU2YlPZBCU8Zs5jmlAPzHLXs=";
  cargoBuildFlags = [ "--features=c-undef" ];

  meta = with lib; {
    description = "Reimplementation of genkfs in Rust";
    homepage = "https://github.com/siraben/regenkfs";
    license = licenses.mit;
    maintainers = with maintainers; [ siraben ];
  };
}
