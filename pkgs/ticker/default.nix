{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "ticker";
  version = "2.4.0";

  src = fetchFromGitHub {
    owner = "achannarasappa";
    repo = "ticker";
    rev = "v${version}";
    sha256 = "sha256-O0cpBJ+llcuw9ts5ihSLX6mHunZH6YAyV3OqNdbj4c4=";
  };

  vendorSha256 = "sha256-q7ANs7fxDt2ADBooP4iS09NJrMnqqDzZYK/34ybm84k=";

  meta = with lib; {
    description = "Terminal stock ticker with live updates and position tracking";
    homepage = "https://github.com/achannarasappa/ticker";

    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ siraben ];
  };
}
