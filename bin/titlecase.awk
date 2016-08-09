BEGIN { split("a the to at in on with and but or", w)
        for (i in w) nocap[w[i]] }

function cap(word) {
    return toupper(substr(word,1,1)) tolower(substr(word,2))
}

{
  for (i=1; i<=NF; ++i) {
      printf "%s%s", (i==1||i==NF||!(tolower($i) in nocap)?cap($i):tolower($i)),
                     (i==NF?"\n":" ")
  }
}
