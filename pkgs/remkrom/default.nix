{ stdenv, lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "remkrom";
  version = "0.1.0";

  src = fetchFromGitHub {
    # https://github.com/siraben/remkrom
    owner = "siraben";
    repo = pname;
    rev = "86a0b19c1d382a029ecaa96eeca7e9f76c8561d6";
    sha256 = "1hp996p1lb8dgalwf7limwf11s6a9fsq5jmmfiwllxsvbxyws5qf";
  };

  cargoSha256 = "1ikaz1vgzfrczspnj4xjf9pdj4j6a9zjc0i1mf538hgqx75libjx";

  meta = with stdenv.lib; {
    description = "Reimplementation of mkrom in Rust";
    homepage = "https://github.com/siraben/remkrom";
    license = licenses.mit;
    maintainers = with maintainers; [ siraben ];
  };
}
