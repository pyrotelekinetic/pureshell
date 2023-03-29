{

description = "A very simple shell";

inputs = {
  nixpkgs = {
    type = "github";
    owner = "NixOS";
    repo = "nixpkgs";
    ref = "release-22.11";
  };
};

outputs = { self, nixpkgs }:
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
  packages.x86_64-linux.default =
    pkgs.stdenv.mkDerivation {
      name = "pureshell";
      meta = {
        license = pkgs.lib.licenses.agpl3Plus;
        description = "A very simple shell";
      };
      src = ./src;
      buildInputs = [
        pkgs.ghc
      ];
      buildPhase = "ghc Main.hs -o pureshell";
      installPhase = "mkdir -p $out/bin; install -t $out/bin pureshell";
    };

  devShells.x86_64-linux.default = with pkgs;
    mkShell {
      packages = [
        ghcid
        hlint
      ];
      buildInputs = [
        ghc
      ];
    };
  };

}
