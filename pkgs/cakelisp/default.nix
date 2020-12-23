{ stdenv, lib, fetchFromGitHub, clang, jam }:

stdenv.mkDerivation {
  pname = "cakelisp";
  version = "unstable-2020-12-21";

  src = fetchFromGitHub {
    owner = "makuto";
    repo = "cakelisp";
    rev = "226bb4385a6fb6d61d37a5be8100004a140e5f65";
    sha256 = "05fyj9a8m44kc3lzyqz4a8dnwa2rpcq981ryszsacywsng46nb01";
  };

  nativeBuildInputs = [ jam ];

  buildInputs = [ clang ];

  postPatch = ''
    substituteInPlace src/Logging.hpp --replace 'log;' 'gLog;'
    substituteInPlace src/Logging.cpp --replace 'log =' 'gLog ='
    substituteInPlace src/Utilities.cpp --replace 'log.' 'gLog.'
    substituteInPlace src/Tokenizer.cpp --replace 'log.' 'gLog.'
    substituteInPlace src/FileUtilities.cpp --replace 'log.' 'gLog.'
    substituteInPlace src/Main.cpp --replace 'log.' 'gLog.'
    substituteInPlace src/Evaluator.cpp --replace 'log.' 'gLog.'
    substituteInPlace src/Writer.cpp --replace 'log.' 'gLog.'
    substituteInPlace src/RunProcess.cpp --replace 'log.' 'gLog.'
    substituteInPlace src/ModuleManager.cpp --replace 'log.' 'gLog.'

    ${lib.optionalString stdenv.isDarwin "substituteInPlace Jamrules --replace 'OS_DEPENDENT_LINKFLAGS = --export-dynamic ;' 'OS_DEPENDENT_LINKFLAGS = -export_dynamic ;'"}

    substituteInPlace runtime/HotReloading.cake \
        --replace '"/usr/bin/clang++"' '"${clang}/bin/clang++"'
    substituteInPlace src/ModuleManager.cpp \
        --replace '"/usr/bin/clang++"' '"${clang}/bin/clang++"'
  '';

  buildPhase = ''jam "-j$NIX_BUILD_CORES"'';

  installPhase = ''
    mkdir -p $out/bin
    cp bin/cakelisp $out/bin/
  '';
}
