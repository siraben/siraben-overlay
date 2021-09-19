{ lib, stdenv, fetchFromGitHub, python3Packages, wrapQtAppsHook }:

python3Packages.buildPythonApplication rec {
  pname = "rmview";
  version = "unstable-2021-09-17";

  src = fetchFromGitHub {
    owner = "bordaigorl";
    repo = pname;
    rev = "60ebcae9841ed408aab08ac151db98728929db67";
    sha256 = "sha256-M9LhMJU13Y+3UxMVnBBM8MPOa6+77XOx7RCZCwoqAE8=";
  };

  nativeBuildInputs = with python3Packages; [ pyqt5 wrapQtAppsHook ];
  propagatedBuildInputs = with python3Packages; [ pyqt5 paramiko twisted service-identity pyopenssl ];

  preBuild = ''
    pyrcc5 -o src/rmview/resources.py resources.qrc
  '';

  preFixup = ''
    wrapQtApp "$out/bin/rmview"
  '';

  meta = with lib; {
    description = "Fast live viewer for reMarkable 1 and 2";
    homepage = "https://github.com/bordaigorl/rmview";
    license = licenses.gpl3;
    maintainers = [ maintainers.nickhu ];
  };
}
