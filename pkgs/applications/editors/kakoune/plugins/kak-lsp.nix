{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "kak-lsp";
  version = "9.0.0";

  src = fetchFromGitHub {
    owner = "kak-lsp";
    repo = "kak-lsp";
    rev = "v${version}";
    sha256 = "sha256-yFmbcHEZBjs4OX+FQEXV7CQMwVR3qPlDYdOoV7wT2/E=";
  };

  installPhase = ''
    mkdir -p $out/bin $out/share/kak/autoload/plugins/
    cp kak-lsp $out/bin/
  '';

  meta = with lib; {
    description = "Kakoune language server protocol client";
    homepage = "https://github.com/kak-lsp/kak-lsp";
    license = licenses.unlicense;
    maintainers = with maintainers; [ cipharius ];
    platforms = platforms.all;
  };
}
