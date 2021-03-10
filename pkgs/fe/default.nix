{ lib, stdenv, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "fe";
  version = "unstable-2021-02-24"; # breaks on latest nightly
  # version = "0.2.0-alpha";

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "fe";
    rev = "5e716a62b67deedcd02de3c7d891c9610273fb53";
    sha256 = "sha256-eBaK2m7gRt0bbbz0ESCGIjIDxHP98GvSSn9dmkbat1k=";
  };

  cargoSha256 = "sha256-03VYpeW48e2fQ+Z3sV1c5O4tWeuNK61lik1HUo1+0iE=";
  RUSTC_BOOTSTRAP = 1;

  meta = with lib; {
    description = "A statically typed smart contract language for the Ethereum Virtual Machine";
    homepage = "https://github.com/ethereum/fe";
    license = licenses.asl20;
    maintainers = with maintainers; [ siraben ];
  };
}
