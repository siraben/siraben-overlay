{ lib, stdenv, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "mosaic";
  version = "unstable-2022-03-20";

  src = fetchFromGitHub {
    owner = "ahhhh6980";
    repo = "mosaic";
    rev = "a1b0f06f46180f6ab1624a87d75791d5293bcf60";
    sha256 = "sha256-0v4sCSCPJvWLy8Y8yPzucxtg2yk1+G4BNBGZNWfKgrs=";
  };

  cargoSha256 = "sha256-Jxvy4QAJ+Lk+RPsum2ZSDD4deVLpSj81q1IuZfoGtBA=";

  meta = with lib; {
    description = "Takes a folder of images (as a palette), and an image, then tiles the palette to resemble the image";
    homepage = "https://github.com/ahhh6980/mosaic";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ siraben ];
  };
}
