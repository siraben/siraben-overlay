{ dockerTools, pkgsMusl }:

dockerTools.buildImage {
  name = "nix-hello-minimal";
  tag = "latest";
  contents = [ pkgsMusl.hello ];
}
