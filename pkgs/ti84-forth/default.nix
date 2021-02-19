{ pkgs, fetchFromGitHub }:

(import
  (fetchFromGitHub {
    owner = "siraben";
    repo = "ti84-forth";
    rev = "97162514f81dce267cafdbd021978efa181177d6";
    sha256 = "1m9ig05c8vzsshn3ihjfwg4a13rg7b3fvg0kz7kbmgvjwiri1h4y";
  })
  { inherit pkgs; })
