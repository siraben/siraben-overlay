{ fetchFromGitHub, the-powder-toy, meson, cmake, luajit, ninja }:

the-powder-toy.overrideAttrs (oA: {
  src = fetchFromGitHub {
    owner = "The-Powder-Toy";
    repo = "The-Powder-Toy";
    rev = "snapshot-206";
    sha256 = "sha256-GuO1uCEzvrhUQlMD4FvqNBjtYj3yNm2ybXXjgrgT/uI=";
  };
  nativeBuildInputs = [ meson cmake ninja ] ++ oA.nativeBuildInputs;
  buildInputs = [ luajit ] ++ oA.buildInputs;
  installPhase = ''
    install -Dm 755 powder $out/bin/powder
  '';
})
