{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "regit";
  version = "unstable-2021-08-25";

  src = fetchFromGitHub {
    owner = "WithGJR";
    repo = "regit-go";
    rev = "fba26f9352c9263ffb4a9ad6152a783cd5e64963";
    sha256 = "sha256-oYzDU2E5tpHmDBTv2jv6vVHpuSZ6eYm1JnrL+Hrmxb8=";
  };

  vendorSha256 = "sha256-pQpattmS9VmO3ZIQUFn66az8GSmB4IvYhTTCFn6SUmo=";

  meta = with lib; {
    description = "A Tiny Git-compatible Git Implementation";
    homepage = "https://github.com/WithGJR/regit-go";
    # no license
    # license = licenses.mit;
    maintainers = with maintainers; [ siraben ];
  };
}
