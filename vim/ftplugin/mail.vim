" From: Christian Brabandt <cblists@256bit.org>
" Subject: Re: reminder for missing attachment
" Date: Fri, 16 Jan 2009 10:12:03 +0100
" Message-ID: <20090116091203.GB3197@256bit.org>

function! CheckAttach()
    "let check='attach,angehängt,attachment,Anhang'
    let check='attach,angehängt,anbei,angehaengt,attachment,anhang,Anhang'
    let oldPos=getpos('.')
    let ans=1
    let val = join(split(escape(check,' \.+*'), ','),'\|')
    1
    if search('\%('.val.'\)','W')
        let ans=input("Attach file?: (leave empty to abbort): ", "", "file")
        while (ans != '')
            normal magg}-
            call append(line('.'), 'Attach: '.ans)
            redraw
            let ans=input("Attach another file?: (leave empty to abbort): ", "", "file")
        endwhile
    endif
    exe ":write ". expand("<amatch>")
    call setpos('.', oldPos)
endfu

augroup script
    au!
    au BufWriteCmd,FileWriteCmd mutt* :call CheckAttach()
augroup END
