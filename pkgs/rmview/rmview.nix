{ stdenv, fetchFromGitHub, mkDerivationWith, pkgs, python3Packages, wrapQtAppsHook }:

mkDerivationWith python3Packages.buildPythonApplication rec {
  pname = "rmview";
  version = "unstable-2020-12-22";

  src = fetchFromGitHub {
    owner = "bordaigorl";
    repo = pname;
    rev = "1feb3982b8e9d5c03d84ab8e77cfb3d2bcfc1890";
    sha256 = "0463zc26r4di1j7d6b459k5d54cfw1s6r4i9x9bss48flzy9jccr";
  };

  patchPhase = "substituteInPlace src/rmview/rmview.py --replace 'from . import resources' ''";

  dontWrapQtApps = true;
  preFixup = ''
    makeWrapperArgs+=("''${qtWrapperArgs[@]}")
  '';

  nativeBuildInputs = [ wrapQtAppsHook ];

  propagatedBuildInputs = with python3Packages; [
    pyqt5
    paramiko
    twisted
  ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/bordaigorl/rmview";
    description = "Library to get the currently playing song and artist from Spotify";
    license = licenses.mit;
    maintainers = with maintainers; [ siraben ];
    platforms = platforms.unix;
  };
}
