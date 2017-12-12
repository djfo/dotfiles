module Main where

import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Util.CustomKeys
import           XMonad.Util.Run

main :: IO ()
main =
  do
    h <- spawnPipe "dzen2 -dock"

    xmonad $ docks def {
      terminal = "gnome-terminal"
    , keys = customKeys delkeys inskeys
    , logHook = dynamicLogWithPP $ def { ppOutput = hPutStrLn h }
    , layoutHook = avoidStruts $ layoutHook def
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
