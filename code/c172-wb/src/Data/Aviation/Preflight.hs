{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Data.Aviation.Preflight where

import Control.Category((.))
import Control.Lens((^.))
import Data.Aviation.C172.WB
import Data.Aviation.Units(kilograms, inches, pounds)
import Data.Aviation.WB
import Data.Monoid(mempty)
import Data.Semigroup((<>))
import Data.String(String)

tonymorris = 80 ^. kilograms
jessica = 55 ^. kilograms
joshua = 64 ^. kilograms

vhlseBEW :: Weight
vhlseBEW = 1691.6 ^. pounds

vhlseArms :: C172AircraftArms Arm
vhlseArms = bewC172AircraftArms (40.6 ^. inches)

vhvvoBEW :: Weight
vhvvoBEW = 1684.3 ^. pounds

vhvvoArms :: C172AircraftArms Arm
vhvvoArms = bewC172AircraftArms (40.6 ^. inches)

ourflight ::
  C172Arms Weight
ourflight =
  C172Arms
    (tonymorris <> joshua)
    (jessica <> mempty)
    (50 ^. usgallonsV . avgas100LL)
    (30 ^. kilograms)
    (10 ^. kilograms)

flightMoments ::
  (String, Weight, C172Arms Weight, C172AircraftArms Arm, String)
flightMoments =
  (
    "20170131 Our Flight VH-VVO SIMULATION"
  , vhvvoBEW
  , ourflight
  , vhvvoArms
  , "dist/ourflight"
  )
