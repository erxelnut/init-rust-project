{
  description = "A very basic rust env flake";
# yes, a very basic one, not optimized for packaging
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: let
  	pkgs = nixpkgs.legacyPackages."x86_64-linux";
	#python = pkgs.python3;

  in {
  	devShells.x86_64-linux.default = pkgs.mkShell {
		buildInputs = with pkgs; [
			cargo rustc rustfmt clippy rust-analyzer glib
		];
		nativeBuildInputs = [ pkgs.pkg-config ];
		env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
	};

  };
}
