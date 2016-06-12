import XMonad
import XMonad.Util.CustomKeys

main :: IO ()
main =
  xmonad def {
    terminal = "gnome-terminal"
  , keys = customKeys delkeys inskeys
  }
  where
    delkeys :: XConfig l -> [(KeyMask, KeySym)]
    delkeys XConfig {modMask = modm} =
      [ (modm .|. shiftMask, xK_space) ]
    inskeys :: XConfig l -> [((KeyMask, KeySym), X ())]
    inskeys conf@(XConfig {modMask = modm}) =
      [ ((modm .|. shiftMask, xK_space), spawn "cycle-kbd-layout" ) ]
