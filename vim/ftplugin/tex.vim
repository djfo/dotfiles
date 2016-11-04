noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> 0 (v:count == 0 ? 'g0' : '0')
noremap <silent> <expr> $ (v:count == 0 ? 'g$' : '$')
