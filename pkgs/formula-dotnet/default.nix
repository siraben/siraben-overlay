{ lib, stdenv, fetchFromGitHub, buildDotnetModule }:

buildDotnetModule rec {
  pname = "formula-dotnet";
  version = "2.0";

  src = fetchFromGitHub {
    owner = "VUISIS";
    repo = "formula-dotnet";
    rev = "60dd3d91d931a795fa9fe6b6054f63e03cec9d28";
    sha256 = "sha256-7odYV4FtImzX3vMUfO7sPlXkw6mOkZOFbnQLpJDXJc4=";
  };

  nugetDeps = ./nuget.nix;

  projectFile = "Src/CommandLine/CommandLine.csproj";
  meta = with lib; {
    description = "Formal Specifications for Verification and Synthesis";
    homepage = "https://github.com/VUISIS/formula-dotnet";
    license = licenses.mit;
    maintainers = with maintainers; [ siraben ];
    platforms = platforms.unix;
  };
}
