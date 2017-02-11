" =============================================================================
" File:          autoload/ctrlp/ctags.vim
" Description:   Example extension for ctrlp.vim
" =============================================================================

" To load this extension into ctrlp, add this to your vimrc:
"
"     let g:ctrlp_extensions = ['ctags']
"
" Where 'ctags' is the name of the file 'ctags.vim'
"
" For multiple extensions:
"
"     let g:ctrlp_extensions = [
"         \ 'my_extension',
"         \ 'my_other_extension',
"         \ ]

" Load guard
if ( exists('g:loaded_ctrlp_ctags') && g:loaded_ctrlp_ctags )
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_ctags = 1


" Add this extension's settings to g:ctrlp_ext_vars
"
" Required:
"
" + init: the name of the input function including the brackets and any
"         arguments
"
" + accept: the name of the action function (only the name)
"
" + lname & sname: the long and short names to use for the statusline
"
" + type: the matching type
"   - line : match full line
"   - path : match full line like a file or a directory path
"   - tabs : match until first tab character
"   - tabe : match until last tab character
"
" Optional:
"
" + enter: the name of the function to be called before starting ctrlp
"
" + exit: the name of the function to be called after closing ctrlp
"
" + opts: the name of the option handling function called when initialize
"
" + sort: disable sorting (enabled by default when omitted)
"
" + specinput: enable special inputs '..' and '@cd' (disabled by default)
"
call add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#ctags#init()',
	\ 'accept': 'ctrlp#ctags#accept',
	\ 'lname': 'search for ctags',
	\ 'sname': 'ctags',
	\ 'type': 'line',
	\ 'enter': 'ctrlp#ctags#enter()',
	\ 'exit': 'ctrlp#ctags#exit()',
	\ 'opts': 'ctrlp#ctags#opts()',
	\ 'sort': 0,
	\ 'specinput': 0,
	\ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
let s:current_dir = expand("<sfile>:p:h")
function! ctrlp#ctags#init()
  syn match Type "^> [^ \t]*[ \t]"
  syn match Comment "\^.*\$"
  let lines = []
	let tagfiles = sort(split(&tags, ','))
	for tagfile in tagfiles
        if ! filereadable(tagfile)
            continue
        endif
        " let result = system('cat "' . tagfile . '"')
        let result = system('python ' . s:current_dir . "/search-tags.py " . tagfile . " '' | sort")
        let lines = lines + split(result, '\n')
    endfo
	return lines
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#ctags#accept(mode, str)
	" For this example, just exit ctrlp and run help

	call ctrlp#exit()
  let line = a:str
  "let index = stridx(line, ':')
  "let filename = line[0 : index - 1]
  "let expr = line[index + 1 :]

  "let line = 'test/file.py /^def func_name():$/ func_name m'
  let filename = substitute(line, '\([^ \t]*\).*', '\1', '')
  let expr = substitute(line, '.*\(/\^.*\$/\).*', '\1', '')
  exec ":e " . filename
  exec ":" . expr
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#ctags#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#ctags#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#ctags#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#ctags#id()
	return s:id
endfunction


" Create a command to directly call the new search type
"
" Put this in vimrc or plugin/ctags.vim
" command! CtrlPCtags call ctrlp#init(ctrlp#ctags#id())


" vim:nofen:fdl=0:ts=2:sw=2:sts=2
