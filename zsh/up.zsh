up() {
  # up -- go up one directory
  if [ $# -eq 0 ]; then
    cd ..
  elif [ $# -eq 1 ]; then
    # up <n> -- go up n directories
    if [[ $1 =~ ^[0-9]+$ ]]; then
      tmp="$PWD"
      for i in `seq $1`; do
        cd ..
      done
      cd "$tmp"
      cd -
    # up <filename> -- go up until we find a file with given name
    else
      tmp="$PWD"
      cd ..
      while true; do
        if [ -e $1 ]; then
          break
        fi
        if [ "$PWD" = / ]; then
          break
        fi
        cd ..
      done
      # make 'cd -' work correctly
      cd "$tmp"
      cd -
    fi
  fi
}
