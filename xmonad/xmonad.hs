{-# OPTIONS_GHC -Wall #-}

module Main where

import           System.Environment
import           System.FilePath
import qualified System.Info                 as I

import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Layout.ResizableTile
import           XMonad.Layout.Spacing
import           XMonad.Util.CustomKeys
import           XMonad.Util.Run

main :: IO ()
main =
  do
    exeDir <- takeDirectory <$> getExecutablePath
    appendPath exeDir

    myLogHook <- initLogHook

    xmonad $ docks def {
      terminal = myTerminal
    , keys = customKeys delkeys inskeys
    , logHook = myLogHook
    , layoutHook = bordered $ avoidStruts myLayout
    , manageHook = title =? "xclock" --> doFloat
    , normalBorderColor = "gray"
    , focusedBorderColor = "white"
    }
  where
    bordered layout =
      let border = Border 2 2 2 2
      in
      spacingRaw True border True border True layout

    delkeys :: XConfig l -> [(KeyMask, KeySym)]
    delkeys XConfig {modMask = modm} =
      [ (modm .|. shiftMask, xK_space) ]

    inskeys :: XConfig l -> [((KeyMask, KeySym), X ())]
    inskeys (XConfig {modMask = modm}) =
      [ ((modm .|. shiftMask, xK_space), spawn "cycle-kbd-layout")
      , ((modm .|. controlMask, xK_b), sendMessage ToggleStruts)
      , ((modm, xK_a), sendMessage MirrorShrink)
      , ((modm, xK_z), sendMessage MirrorExpand)
      , ((0, 0x1008ff11), spawn "amixer -q sset Master 2%-")
      , ((0, 0x1008ff13), spawn "amixer -q sset Master 2%+")
      , ((modm, xK_p), spawn "rofi -show run")
      ]

    myTerminal = "urxvt"

    initLogHook
      | osDarwin  = return $ logHook def
      | otherwise = dzen2Logger

dzen2Logger :: IO (X ())
dzen2Logger = do
  h <- spawnPipe "dzen2 -dock -xs 2"
  return $ dynamicLogWithPP $ def { ppOutput = hPutStrLn h }

myLayout :: Choose Tall (Choose (Mirror Tall) Full) a
myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled = Tall nmaster delta ratio

    nmaster = 1
    ratio = 1/2
    delta = 3/100

osDarwin :: Bool
osDarwin = I.os == "darwin"

appendPath :: FilePath -> IO ()
appendPath newPath = do
  envPath <- lookupEnv "PATH"
  setEnv "PATH" $ maybe newPath (\p -> newPath ++ ":" ++ p) envPath
