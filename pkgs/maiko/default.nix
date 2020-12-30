{ clangStdenv, fetchFromGitHub, x11 }:

let
  platform = clangStdenv.targetPlatform.parsed.kernel.name;
in

clangStdenv.mkDerivation rec {
  pname = "maiko";
  version = "unstable-2020-12-29";

  src = fetchFromGitHub {
    owner = "Interlisp";
    repo = pname;
    rev = "c395b816d836988e1c3896d877490533f15f1fad";
    sha256 = "16zll1shlzjah3i4fn83ci8hgwrgv7qkdd2asldal94i32j6wc08";
  };

  enableParallelBuilding = true;

  buildInputs = [ x11 ];

  postPatch = ''
    patchShebangs bin/makeright
    # substituteInPlace bin/makeright --replace '../\$\{osversion\}.\$\{architecture\}' '${platform}'
    substituteInPlace bin/makefile-tail --replace '/bin/rm' 'rm'
  '';

  buildPhase = ''
    cd bin
    ./makeright x
    cd ..
  '';

  installPhase = ''
    cp -r linux.x86_64/. $out
    cp -r bin/. $out
  '';

  isBroken = true;

  meta = with clangStdenv.lib; {
    description = " Medley Interlisp virtual machine ";
    platform = platforms.unix;
    maintainers = [ maintainers.siraben ];
    license = licenses.mit;
  };
}
