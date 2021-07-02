{ lib, stdenv, fetchFromGitHub, rustPlatform, libiconv }:

rustPlatform.buildRustPackage rec {
  pname = "fe";
  version = "v0.6.1-alpha";

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "fe";
    rev = version;
    sha256 = "sha256-207At/DCuY/tI52X8MBj1XYP+p1sqRJ0c1b5VsfTTY4=";
  };

  buildInputs = [ libiconv ];

  cargoSha256 = "sha256-KbGuahnYsKQ58f/rHb47hn+nMlErvVMw7C6gJ3jbklY=";
  RUSTC_BOOTSTRAP = 1;

  meta = with lib; {
    description = "A statically typed smart contract language for the Ethereum Virtual Machine";
    homepage = "https://github.com/ethereum/fe";
    license = licenses.asl20;
    maintainers = with maintainers; [ siraben ];
  };
}
