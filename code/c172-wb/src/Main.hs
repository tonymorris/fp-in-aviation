{-# LANGUAGE NoImplicitPrelude #-}

module Main(
  main
) where

import Data.Aviation.C172.Diagrams(renderMomentDiagrams)
import Data.Aviation.C172.WB(totalC172Moment)
import Data.Aviation.Preflight(flightMoments)
import Data.Maybe(Maybe(Just))
import Diagrams.Prelude(V2(V2), mkSizeSpec)
import System.IO(IO)

main ::
  IO ()
main =
  let (s, w, ws, a, o) = flightMoments
  in  renderMomentDiagrams
        s
        (totalC172Moment w ws a)
        (mkSizeSpec (V2 (Just 800) (Just 1131.2)))
        o
