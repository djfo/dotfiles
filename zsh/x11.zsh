#BUILTIN_DISPLAY=eDP1
#EXTERNAL_DISPLAY=DP2

BUILTIN_DISPLAY=LVDS1
EXTERNAL_DISPLAY=VGA1

function dual() {
  xrandr --output $BUILTIN_DISPLAY --auto
  xrandr --output $EXTERNAL_DISPLAY --primary --left-of $BUILTIN_DISPLAY --auto
}

function mirror() {
  xrandr --output $EXTERNAL_DISPLAY --primary --same-as $BUILTIN_DISPLAY --auto
}

function internal() {
  xrandr --output $EXTERNAL_DISPLAY --off
}

function external() {
  xrandr --output $BUILTIN_DISPLAY --off
}
