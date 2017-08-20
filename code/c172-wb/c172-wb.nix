{ mkDerivation, aviation-cessna172-diagrams
, aviation-cessna172-weight-balance, aviation-units
, aviation-weight-balance, base, colour, containers, diagrams
, diagrams-cairo, diagrams-core, diagrams-lib, diagrams-rasterific
, diagrams-svg, directory, doctest, filepath, fixed-vector
, hgeometry, lens, mtl, parsec, plots, QuickCheck, quickcheck-text
, stdenv, template-haskell
}:
mkDerivation {
  pname = "c172-preflight";
  version = "0.0.1";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aviation-cessna172-diagrams aviation-cessna172-weight-balance
    aviation-units aviation-weight-balance base colour containers
    diagrams diagrams-cairo diagrams-core diagrams-lib
    diagrams-rasterific diagrams-svg fixed-vector hgeometry lens mtl
    plots
  ];
  executableHaskellDepends = [
    aviation-cessna172-diagrams aviation-cessna172-weight-balance
    aviation-units aviation-weight-balance base colour containers
    diagrams diagrams-cairo diagrams-core diagrams-lib
    diagrams-rasterific diagrams-svg fixed-vector hgeometry lens mtl
    plots
  ];
  testHaskellDepends = [
    base directory doctest filepath parsec QuickCheck quickcheck-text
    template-haskell
  ];
  homepage = "https://github.com/tonymorris/c172-preflight";
  description = "C172";
  license = stdenv.lib.licenses.bsd3;
}
