module Main where

import           Control.Concurrent
import           Control.Monad
import           Data.Time
import           System.IO          (hGetLine)
import           System.Process
import           XMonad.Util.Run

main :: IO ()
main = do
  h <- spawnPipe "dzen2 -dock -xs 2 -x 1200 -ta r"
  void $ forever $ do
    formattedTime <- getFormattedTime
    hPutStrLn h formattedTime
    threadDelay $ 1000 * 1000

getFormattedTime :: IO String
getFormattedTime = do
  tz <- getCurrentTimeZone
  time <- utcToLocalTime tz <$> getCurrentTime
  return $ formatTime defaultTimeLocale "%c" time
