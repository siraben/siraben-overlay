{ dockerTools, hello }:

dockerTools.buildLayeredImage {
  name = "nix-hello";
  tag = "latest";
  contents = [ hello ];
}
