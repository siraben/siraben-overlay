{ lib, mkDerivation, fetchFromGitHub, haskeline_0_8_1_1, json, extra
, cond, hspec, regex-compat, alex, happy }:

mkDerivation rec {
  pname = "koka";
  version = "2.1.1";

  src = fetchFromGitHub {
    owner = "koka-lang";
    repo = "koka";
    rev = "v${version}";
    sha256 = "sha256-2xnJAm95ErjfXyTOQUevoB/sGfrKZH+ePoQsyIW1DpU=";
  };
  
  executableHaskellDepends =  [
    haskeline_0_8_1_1 json extra cond hspec regex-compat
  ];

  executableToolDepends = [ alex happy ];

  doCheck = false;

  description = "Koka language compiler and interpreter ";
  homepage    = "https://github.com/koka-lang/koka";
  license     = lib.licenses.asl20;
  maintainers = with lib.maintainers; [ siraben ];
  platforms   = lib.platforms.unix;

}
