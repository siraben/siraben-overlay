{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "rmfakecloud";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "ddvk";
    repo = "v${pname}";
    rev = "5617d72948e5b04972800ed505cb3d8b698b728c";
    sha256 = "01amkh4ybi0cy6fs7x86phj0bv753vmcrjprxhvmarc7w5pmw3h9";
  };

  vendorSha256 = "039898vs09y39vqpqzz32lv09v85gxlzn4vnrnv3k2r3rmicb3vv";

  meta = with stdenv.lib; {
    description = "Fake cloud API for the reMarkable tablet";
    homepage = "https://github.com/ddvk/rmfakecloud";
    license = licenses.agpl3;
    maintainers = [ maintainers.siraben ];
    platforms = platforms.unix;
  };
}
