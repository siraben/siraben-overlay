{ stdenv, lib, darwin, fetchFromGitLab, mescc-tools-seed, guile }:

stdenv.mkDerivation rec {
  pname = "mes";
  version = "unstable-2020-12-13";
  
  src = fetchFromGitLab {
    owner = "janneke";
    repo = pname;
    rev = "b601eb64af6d10f3462e5d480f972b65b6c01808";
    sha256 = "1pjihnncszxhfbgx656qiic6sf9z31wd9gsrk76m5nqnj55p6wrb";
  };

  configureFlags = [ "--with-courage" "--with-system-libc" ];

  nativeBuildInputs = [ mescc-tools-seed guile ];

  buildInputs = lib.optional stdenv.isDarwin darwin.cctools;

  hardeningDisable = [ "all" ];
}
