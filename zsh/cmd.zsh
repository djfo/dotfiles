yt() {
  q=`echo $* | tr ' ' +`
  open https://www.youtube.com/results\?search_query=$q
}

wh() {
  q=`echo $* | tr ' ' +`
  open https://www.willhaben.at/iad/kaufen-und-verkaufen/marktplatz\?keyword=$q
}
