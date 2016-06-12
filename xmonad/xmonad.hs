import XMonad

main :: IO ()
main =
  xmonad def {
    terminal = "gnome-terminal"
  }
