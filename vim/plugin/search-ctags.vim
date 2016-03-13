command! ScratchBuffer setlocal buftype=nofile bufhidden=hide noswapfile

function! SearchCTags()
    let expression = input('search tags:')
    if empty(expression) | return | endif
    call SearchCTagsArg(expression)
endfunction

let s:current_dir = expand("<sfile>:p:h")
function! SearchCTagsArg(expression)
    let expression = a:expression
    sp
    enew
    set modifiable
    resize 10
	let tagfiles = sort(split(&tags, ','))
	for tagfile in tagfiles
        if ! filereadable(tagfile)
            continue
        endif
        let result = system(s:current_dir . "/search-tags.py " . tagfile . " " . expression . " | sort")
        call append(line('0'), split(result, '\n'))
    endfo
    0
    ScratchBuffer
    "set nomodifiable
    "nnoremap <buffer> <esc> :bd!<CR>
    "nnoremap <buffer> <leader>q :bd!<CR>
    nnoremap <buffer> <CR> :call SearchCTagsGoto()<CR>
    " colors
    syn match Type "^[^:]*:"
    syn match Comment ":.*$"
    let nblines = line('$')
    if nblines == 2
        call SearchCTagsGoto()
    endif
endfunction

function! SearchCTagsGoto()
    let line = getline('.')
    bd!
    let index = stridx(line, ':')
    let filename = line[0 : index - 1]
    let expr = line[index + 1 :]
    exec ":e " . filename
    0
    exec ":" . expr
endfunction

