function! SearchCTags()
    sp
    enew
    resize 10
    let l:expression = input('search tags:')
    if empty(l:expression) | return | endif
	let l:tagfiles = sort(split(&tags, ','))
	for l:tagfile in l:tagfiles
        if ! filereadable(l:tagfile)
            continue
        endif

        let l:result = system("search-tags.py " . l:tagfile . " " . l:expression . " | sort")
        call append(line('0'), split(l:result, '\n'))
    endfo
    0
    "nnoremap <buffer> <esc> :bd!<CR>
    "nnoremap <buffer> q :bd!<CR>
    nnoremap <buffer> <CR> :call SearchCTagsGoto()<CR>
    " colors
    syn match Type "^[^:]*:"
    syn match Comment ":.*$"
endfunction

function! SearchCTagsGoto()
    let l:line = getline('.')
    bd!
    let l:index = stridx(line, ':')
    let l:filename = line[0 : l:index - 1]
    let l:expr = line[l:index + 1 :]
    exec ":e " . l:filename
    exec ":" . l:expr
endfunction

