{ mkDerivation, base, directory, doctest, either, filepath, lens
, network-uri, QuickCheck, stdenv, stratux, template-haskell, text
, time, transformers
}:
mkDerivation {
  pname = "fp-in-aviation";
  version = "0.0.1";
  src = ./.;
  libraryHaskellDepends = [
    base either lens network-uri stratux text time transformers
  ];
  testHaskellDepends = [
    base directory doctest filepath QuickCheck template-haskell
  ];
  homepage = "https://github.com/tonymorris/fp-in-aviation";
  description = "A demonstration of the stratux library";
  license = stdenv.lib.licenses.bsd3;
}
