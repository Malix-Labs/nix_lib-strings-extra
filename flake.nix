{
  description = "An extension of Nix lib for strings";

  inputs.nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

  outputs =
    { nixpkgs }:
    let
      inherit (nixpkgs) lib;

      directory_source = ./src;

      characters = import "${directory_source}/characters.nix" { inherit lib; };
      parse = import "${directory_source}/parse.nix" { inherit lib characters; };
      case = import "${directory_source}/case.nix" { inherit lib parse; };
    in
    characters // parse // case;
}
