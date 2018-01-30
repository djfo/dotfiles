module Main where

import           Control.Concurrent
import           Control.Monad
import           Data.Time
import           System.Environment (getArgs)
import           System.IO          (hGetLine)
import           System.Process
import           XMonad.Util.Run

main :: IO ()
main = do
  args <- getArgs

  let tz | "--aoe" `elem` args = return aoe
         | "--utc" `elem` args = return utc
         | otherwise           = getCurrentTimeZone

  h <- spawnPipe "dzen2 -dock -xs 2 -x 1200 -ta r"
  void $ forever $ do
    formattedTime <- tz >>= getFormattedTimeTZ
    hPutStrLn h formattedTime
    threadDelay $ 1000 * 1000

aoe :: TimeZone
aoe = TimeZone (-12 * 60) False "AoE"

getFormattedTimeTZ :: TimeZone -> IO String
getFormattedTimeTZ tz = do
  time <- utcToLocalTime tz <$> getCurrentTime
  return $ formatTime defaultTimeLocale "%c" time
