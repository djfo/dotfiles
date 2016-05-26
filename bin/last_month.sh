#!/bin/sh
let s=`date +%s`-2592000
date -r $s $*
