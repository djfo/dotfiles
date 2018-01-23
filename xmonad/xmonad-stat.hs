{-# OPTIONS_GHC -Wall #-}

module Main where

import           Control.Concurrent
import           Data.List          (find, isInfixOf)
import           System.IO          (hGetContents)
import           System.Process
import           XMonad.Util.Run

main :: IO ()
main =
  do
    h <- spawnPipe "dzen2 -dock -xs 2 -w 100 -ta l"
    monitorCPULoad (f h) (CPULoad 0 0)
  where
    f h = hPutStrLn h . show . truncate . (*100)

data CPULoad
  = CPULoad {
    cpuTotal :: !Int
  , cpuIdle  :: !Int
  }
  deriving (Eq, Ord, Show)

pause :: IO ()
pause = threadDelay $ 1000*1000

monitorCPULoad :: (Float -> IO ()) -> CPULoad -> IO ()
monitorCPULoad f prev = do
  cur <- getCPULoad
  let diffTotal = fromIntegral $ cpuTotal cur - cpuTotal prev
  let diffIdle = fromIntegral $ cpuIdle cur - cpuIdle prev
  f $ (diffTotal - diffIdle)/diffTotal
  pause
  monitorCPULoad f cur

getCPULoad :: IO CPULoad
getCPULoad = do
  contents <- readFile "/proc/stat"
  let stats = map words . lines $ contents
  let p = (== "cpu") . head
  case find p stats of
    Just rawValues -> do
      let values = map read $ tail rawValues
      let total = sum [values !! i | i <- [0..7]] :: Int
      let wait = sum [values !! i | i <- [3, 4]] :: Int
      return $ CPULoad total wait
    Nothing -> error "getCPULoad"

getBatteryPercentage :: IO String
getBatteryPercentage =
  do
    (_, Just hOut, _, _) <- createProcess upower'
    out <- hGetContents hOut
    let p = ("percentage" `isInfixOf`)
    case find p (lines out) of
      Just line -> return $ last (words line)
      Nothing -> error "getBatteryPercentage"
  where
    upower =
      proc
        "upower"
        [ "-i"
        , "/org/freedesktop/UPower/devices/battery_BAT0"
        ]
    upower' = upower { std_out = CreatePipe }
