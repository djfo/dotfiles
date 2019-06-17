if darwin; then
  xdg-open() {
    open $*
  }
fi

yt() {
  q=`echo $* | tr ' ' +`
  xdg-open https://www.youtube.com/results\?search_query=$q
}

wh() {
  q=`echo $* | tr ' ' +`
  xdg-open https://www.willhaben.at/iad/kaufen-und-verkaufen/marktplatz\?keyword=$q
}
