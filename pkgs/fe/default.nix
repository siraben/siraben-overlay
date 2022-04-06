{ lib, stdenv, fetchFromGitHub, rustPlatform, libiconv }:

rustPlatform.buildRustPackage rec {
  pname = "fe";
  version = "v0.15.0-alpha";

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "fe";
    rev = version;
    sha256 = "sha256-HKzrxodFdX0je33xnJIwK9uvkHT/M8q/rl2S/vFODMo=";
  };

  buildInputs = [ libiconv ];

  cargoSha256 = "sha256-FfYUKDqCx6AP4xOCFwxWZarq0L9B3sZDUxWCPw1UIz0=";

  meta = with lib; {
    description = "A statically typed smart contract language for the Ethereum Virtual Machine";
    homepage = "https://github.com/ethereum/fe";
    license = licenses.asl20;
    maintainers = with maintainers; [ siraben ];
  };
}
