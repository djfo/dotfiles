module Main where

import           System.Environment
import           System.FilePath
import           System.Info (os)
import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Layout.BinarySpacePartition
import           XMonad.Layout.CenteredMaster
import           XMonad.Util.CustomKeys
import           XMonad.Util.Run

main :: IO ()
main =
  do
    exeDir <- takeDirectory <$> getExecutablePath
    envPath <- lookupEnv "PATH"
    setEnv "PATH" $ maybe exeDir (\p -> exeDir ++ ":" ++ p) envPath

    myLogHook <- initLogHook

    xmonad $ docks def {
      terminal = myTerminal
    , keys = customKeys delkeys inskeys
    , logHook = myLogHook
    , layoutHook = avoidStruts myLayout
    }
  where
    delkeys :: XConfig l -> [(KeyMask, KeySym)]
    delkeys XConfig {modMask = modm} =
      [ (modm .|. shiftMask, xK_space) ]

    inskeys :: XConfig l -> [((KeyMask, KeySym), X ())]
    inskeys conf@(XConfig {modMask = modm}) =
      [ ((modm .|. shiftMask, xK_space), spawn "cycle-kbd-layout")
      , ((modm .|. controlMask, xK_b), sendMessage ToggleStruts)
      ]

    myTerminal
      | os == "darwin" = "/usr/local/bin/urxvt"
      | otherwise      = "gnome-terminal"

    initLogHook
      | os == "darwin" = return $ logHook def
      | otherwise = do h <- spawnPipe "dzen2 -dock -xs 2"
                       return $ dynamicLogWithPP $ def { ppOutput = hPutStrLn h }

myLayout = tiled ||| Mirror tiled ||| Full ||| emptyBSP -- (centerMaster Full)
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100
