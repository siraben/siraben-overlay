{ stdenv, lib, fetchFromGitHub, rustPlatform, tree }:

let
  passerine-src = fetchFromGitHub {
    owner = "vrtbl";
    repo = "passerine";
    rev = "69842e5fcd99b973dbe78df97dc56f78603de8a4";
    sha256 = "sha256-GpAhCL+jLV6O/wpEB8FWhfQ3zHcJcA3KWZuFDfRdHWE=";
  };
in

rustPlatform.buildRustPackage rec {
  pname = "aspen";
  version = "unstable-2021-02-09";

  src = fetchFromGitHub {
    owner = "vrtbl";
    repo = "aspen";
    rev = "586c04fde9bb69180546137f404ba901e3cf3d9a";
    sha256 = "sha256-l1TGmES6nDusVdCsknJTgFpywcOs99uch9cslyRBeLA=";
  };

  nativeBuildInputs = [ tree ];
  postPatch = ''
    mkdir passerine
    cp -rp ${passerine-src}/. passerine/
    tree
  '';
  cargoSha256 = "sha256-7J03goXPIcIY4HcM7B3CZeUFXNSBLkZECobIX300kaw=";

  meta = with lib; {
    description = "Passerine's package manager";
    homepage = "https://github.com/vrtbl/aspen";
    license = licenses.mit;
    maintainers = with maintainers; [ siraben ];
  };
}
