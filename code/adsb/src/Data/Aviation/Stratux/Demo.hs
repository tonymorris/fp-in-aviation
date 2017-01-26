{-# LANGUAGE OverloadedStrings #-}

module Data.Aviation.Stratux.Demo where

import Control.Applicative(pure)
import Control.Category((.))
import Control.Concurrent(threadDelay)
import Control.Monad(forever, join)
import Control.Monad.IO.Class(MonadIO(liftIO))
import Control.Monad.Trans.Either(EitherT, runEitherT)
import Data.Aviation.Stratux
import Data.Either(either)
import Data.String(String)
import Control.Lens((^.))
import Data.Function(($))
import Data.Functor((<$>))
import Data.List((++))
import Data.Int(Int)
import Data.Text(Text)
import Network.URI(URIAuth(URIAuth))
import Prelude(Show(show))
import System.IO(IO, putStrLn)
import Text.Printf(printf)

demoSituation ::
  HasSituation s =>
  s
  -> String
demoSituation = 
  let header s = join ["\ESC[92m\ESC[42m", s, "\ESC[m"]
      value s = join ["\ESC[38m\ESC[41m", s, "\ESC[m"]
  in  do  pa <- (^. pressureAlt)
          pc <- (^. pitch)
          rl <- (^. roll)
          hd <- (^. gyroHeading)
          lt <- (^. lat)
          ln <- (^. lon)
          vs <- (^. gpsVertVel)
          ht <- (^. heightAboveEllipsoid)
          cs <- (^. trueCourse)
          gs <- (^. groundSpeed)
          pure (join  [
                  header "p.alt: "
                , value (printf "%*.2fft" (8 :: Int) pa)
                , header " pitch: "
                , value (printf "%*.2fdeg" (7 :: Int) pc)
                , header " roll: "
                , value (printf "%*.2fdeg" (7 :: Int) rl)
                , header " hdg: "
                , value (printf "%*.2fdeg" (7 :: Int) hd)
                , header " lat: "             
                , value (printf "%*.4f" (8 :: Int) lt)
                , header " lon: "
                , value (printf "%*.4f" (9 :: Int) ln)
                , header " v.speed: "
                , value (printf "%*.2fft/min" (9 :: Int) vs)
                , header " hgt: "
                , value (printf "%*.2fft" (8 :: Int) ht)
                , header " tr: "
                , value (printf "%*.2fdeg" (6 :: Int) cs)
                , header " g.speed: "
                , value (printf "%*dkt" (3 :: Int) gs)                
                ])
         
printloop ::
  MonadIO f =>
  Int
  -> f String
  -> f ()
printloop d x =
  forever $
    do  a <- x
        liftIO (putStrLn a)
        liftIO (threadDelay d)

demo1 ::
  IO ()
demo1 =
  printloop
    4000
    (either ("Error: " ++) demoSituation <$> runEitherT (getSituation tmorrisuriauth "" ""))
      
----

demoAirTraffic ::
  HasTraffic s =>
  s
  -> String
demoAirTraffic =
  let header s = join ["\ESC[92m\ESC[42m", s, "\ESC[m"]
      value s = join ["\ESC[38m\ESC[41m", s, "\ESC[m"]
  in  do  t <- (^. tail)
          s <- (^. signalLevel)
          l <- (^. latitude)
          g <- (^. longitude)
          a <- (^. altitude)
          p <- (^. speed)
          v <- (^. verticalVelocity)
          x <- (^. timestamp)
          pure (join  [
                        header "flight: "
                      , value (printf "%*s" (6 :: Int) t)
                      , header " power: "
                      , value (printf "%*.2f dB" (6 :: Int) s)
                      , header " lat: "             
                      , value (printf "%*.4f" (8 :: Int) l)
                      , header " lon: "
                      , value (printf "%*.4f" (9 :: Int) g)
                      , header " alt: "
                      , value (printf "%*dft" (5 :: Int) a)
                      , header " velocity: "
                      , value (printf "%*dkt" (3 :: Int) p)
                      , header " v/velocity: "
                      , value (printf "%*dft/min" (6 :: Int) v)
                      , header " time: "
                      , value (printf "%*s" (27 :: Int) (show x))
                      ])

demo2 ::
  IO ()
demo2 =
  trafficApp
    tmorrisuri
    tmorrisport (
      either
        (\e ->
            putStrLn ("Error: " ++ e))
        (putStrLn . demoAirTraffic)
      )
    ("" :: Text)

----

tmorrisuri ::
  String
tmorrisuri =
  "stratux.tmorris.intra" -- 192.168.43.142"

tmorrisport ::
  Int
tmorrisport =
  80

tmorrisuriauth ::
  URIAuth
tmorrisuriauth =
  (URIAuth "" tmorrisuri "")

thesituation ::
  EitherT String IO Situation
thesituation =
  getSituation tmorrisuriauth "" "" 
