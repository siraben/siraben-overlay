{ stdenv, lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "regenkfs";
  version = "unstable-2020-10-17";

  src = fetchFromGitHub {
    owner = "siraben";
    repo = pname;
    rev = "652155445fc39bbe6628f6b9415b5cd6863f592f";
    sha256 = "19hvxx9cbn13hsykdqfqwq2sjhlm3g7xcr9dzxkwn6jgqfj0wk6f";
  };

  cargoSha256 = "1hz6mf9c9radl7fh8gj9wk3d2gz82r8lqyd163670706r2s5ddhv";

  meta = with lib; {
    description = "Reimplementation of genkfs in Rust";
    homepage = "https://github.com/siraben/regenkfs";
    license = licenses.mit;
    maintainers = with maintainers; [ siraben ];
  };
}
