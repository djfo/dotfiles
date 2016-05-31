function dual() {
  #xrandr --output DP2 --primary --right-of eDP1 --auto
  xrandr --output DP2 --primary --left-of eDP1 --auto
}

function mirror() {
  xrandr --output DP2 --primary --same-as eDP1 --auto
}

function single() {
  xrandr --output DP2 --off
}
