{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "mold";
  version = "unstable-2021-03-08";

  src = fetchFromGitHub {
    owner = "rui314";
    repo = "mold";
    rev = "69f09c9ac4dbd9bd347b8d3bfe636306f38b14fa";
    sha256 = "udFGdbGhb9wo4AKMDcU7GT4loVMJ/yVvGl3nQG53QR4=";
  };

  # buildInputs = [  ];

  meta = with lib; {
    description = "";
    homepage = "https://github.com/rui314/mold";

    # license = licenses.;
    maintainers = with maintainers; [  ];
    platforms = platforms.all;
  };
}
