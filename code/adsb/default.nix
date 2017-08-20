{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  sources = {
    papa = pkgs.fetchFromGitHub {
      owner = "qfpl";
      repo = "papa";
      rev = "97ef00aa45c70213a4f0ce348a2208e3f482a7e3";
      sha256 = "0qm0ay49wc0frxs6ipc10xyjj654b0wgk0b1hzm79qdlfp2yq0n5";
    };

    stratux-types = pkgs.fetchFromGitHub {
      owner = "tonymorris";
      repo = "stratux-types";
      rev = "49459d3d39baf402371e652690cb571d7fe1230f";
      sha256 = "0g1787z2rdxyijfw88nmkspcx8grj0bwvk0mw9rjznirpiad6ggn";
    };

    stratux-websockets = pkgs.fetchFromGitHub {
      owner = "tonymorris";
      repo = "stratux-websockets";
      rev = "b88b8554fbd506898c007870a2008404a7ff8804";
      sha256 = "1pqk067p5llzs1gy2xjf78b27zpsnianwpjc6m0pfxcn9m5n2dp1";
    };

    stratux-http = pkgs.fetchFromGitHub {
      owner = "tonymorris";
      repo = "stratux-http";
      rev = "c0830e614ab317ddbc635fd7fd8ad95ac90b54a6";
      sha256 = "0r6262fpsd8jv4ysfs5734ldj9b84dlqj9p4dd5ckwidc3cfdkhd";
    };

    stratux = pkgs.fetchFromGitHub {
      owner = "tonymorris";
      repo = "stratux";
      rev = "752f27f137649b83c20aa0ef30a7b910e2a805e2";
      sha256 = "0bnzyw09m21aj24clfpv0zf4xcg6wad3x6bhlgii6s82szi0i9sv";
    };

  };

  modifiedHaskellPackages = haskellPackages.override {
    overrides = self: super: import sources.papa self // {
      stratux-types = import sources.stratux-types {};
      stratux-websockets = import sources.stratux-websockets {};
      stratux-http = import sources.stratux-http {};
      stratux = import sources.stratux {};
      parsers = pkgs.haskell.lib.dontCheck super.parsers;        
    };
  };

  adsb = modifiedHaskellPackages.callPackage ./adsb.nix {};

in

  adsb
