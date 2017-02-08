" https://github.com/kien/ctrlp.vim/blob/master/doc/ctrlp.txt#L719
" :help g:ctrlp_match_func
let s:current_dir = expand("<sfile>:p:h")
function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
    " https://github.com/burke/matcher
    " Create a cache file if not yet exists
    let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
    if !( filereadable(cachefile) && a:items == readfile(cachefile) )
        call writefile(a:items, cachefile)
    endif
    if !filereadable(cachefile)
        return []
    endif


    let cmd = 'python ' . s:current_dir . '/ctrlp_match.py ' . a:str . ' < "'. cachefile .'" | sort'
    return split(system(cmd), '\n')

endfunction
