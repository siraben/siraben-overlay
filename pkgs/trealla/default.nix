{ lib, stdenv, fetchFromGitHub, readline, openssl, withThread ? true, withSSL ? true}:

stdenv.mkDerivation rec {
  pname = "trealla";
  version = "1.7.35";

  src = fetchFromGitHub {
    owner = "infradig";
    repo = "trealla";
    rev = "v${version}";
    sha256 = "sha256-e50IL6MW8PHTCqKZUlPwreUtm0cYhXuULenxkbxdZ0I=";
  };

  postPatch = ''
    substituteInPlace Makefile \
      --replace '-I/usr/local/include' "" \
      --replace '-L/usr/local/lib' "" \
      --replace 'GIT_VERSION :=' 'GIT_VERSION ?='
  '';

  makeFlags = [ "GIT_VERSION=\"v${version}\""
                (lib.optionalString withThread "THREADS=1")
                (lib.optionalString (!withSSL) "NOSSL=1")
              ] ++ lib.optional stdenv.isDarwin "NOLDLIBS=1";

  buildInputs = [ readline openssl ];

  installPhase = ''
    install -Dm755 -t $out/bin tpl
  '';

  doCheck = true;
  preCheck = ''
    # Disable test 81 due to floating point error
    rm tests/issues/test081.expected tests/issues/test081.pl
  '';

  meta = with lib; {
    description = "A compact, efficient Prolog interpreter written in ANSI C";
    homepage = "https://github.com/infradig/trealla";
    license = licenses.mit;
    maintainers = with maintainers; [ siraben ];
    platforms = platforms.all;
  };
}