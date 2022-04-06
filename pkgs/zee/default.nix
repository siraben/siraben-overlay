{ lib, stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl, Security, AppKit }:

rustPlatform.buildRustPackage rec {
  pname = "zee";
  version = "unstable-2022-04-01";

  src = fetchFromGitHub {
    owner = "mcobzarenco";
    repo = "zee";
    rev = "c2c943f6dde80a6344d2b6ec4b0487b76efb3990";
    sha256 = "sha256-jFTk1lDcdiU7W2CE8yiKDespayEZZiN4275wnaJX5A4=";
    fetchSubmodules = true;
  };

  cargoSha256 = "sha256-59mbVo2IG1T2AIm48PzU8gbTAQaBav3hAxlLY0xdSCA=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ lib.optionals stdenv.isDarwin [ Security AppKit ];

  meta = with lib; {
    description =g"A modern text editor for the terminal";
    homepage = "https://github.com/mcobzarenco/zee";
    license = licenses.asl20;
    maintainers = with maintainers; [ siraben ];
  };
}
