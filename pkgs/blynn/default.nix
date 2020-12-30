{ clangStdenv, fetchFromGitHub }:

clangStdenv.mkDerivation rec {
  pname = "compiler";
  version = "unstable-2020-11-14";

  src = fetchFromGitHub {
    owner = "blynn";
    repo = pname;
    rev = "42ff37bc98c8b6e9d4fb34510e804d6cfea25d33";
    sha256 = "0d10xn1c7yqb8l2y0a5pq64y7s4qfms7pj033rwmvnmr6n2h0jy3";
  };

  makeFlags = [ "precisely" ];

  installPhase = ''
    install -Dm755 precisely -t $out/bin
  '';

  meta = with clangStdenv.lib; {
    description = "The adventures of a Haskell compiler";
    homepage = "https://github.com/blynn/compiler";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ siraben ];
    platforms = platforms.all;
  };
}
