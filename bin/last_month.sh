#!/bin/sh
let s=`date +%s`-2592000
case `uname` in
  Linux)
    date --date="@$s" $*
    ;;
  Darwin)
    date -r $s $*
    ;;
esac
