" https://github.com/VundleVim/Vundle.vim

filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundlemanage Vundle,required
Plugin 'VundleVim/Vundle.vim'

Plugin 'klen/python-mode'
"
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'

Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'jmcantrell/vim-virtualenv'

Plugin 'davidhalter/jedi-vim'
Plugin 'rking/ag.vim'

Plugin 'gregsexton/gitv'

Plugin 'majutsushi/tagbar'

"Plugin 'python-rope/ropevim'

"Plugin 'ervandew/supertab' " does notauto complete using jedi-vim so better disableit
"Plugin 'tarmack/vim-python-ftplugin'
"Plugin 'jaredly/vim-debug'
"Plugin 'joonty/vdebug'
"
"Plugin 'powerline/powerline'
"Plugin 'mbbill/undotree'
"Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
"Plugin 'hdima/python-syntax'

call vundle#end() " required
filetype plugin indent on " required

" Toignorepluginindentchanges,insteaduse:
" filetypepluginon
"
" Briefhelp
" :PluginList
" :PluginInstall
" :PluginSearch foo
" :PluginClean
"

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:pymode=0

" lint
" https://github.com/klen/python-mode/issues/374
"let pymode_lint_checkers=['pyflakes','pep8','mccabe']
"let pymode_lint_checkers=['pyflakes','mccabe']
"
"disable lin to nwrite and put in on<F3>
let g:pymode_lint=1
let g:pymode_lint_on_write=0
nnoremap <F3> :PymodeLint<CR>


" configurerope
" https://github.com/python-rope/ropevim#variables
let g:ropevim_local_prefix='<C-c>r'
let g:ropevim_global_prefix='<C-x>p'
" disablepymode,itsslowonbufferwrite
let g:pymode_rope=0
let g:pymode_rope_regenerate_on_write=0

" disablepythonfolding
" setfoldlevelstart=10
" setnofoldenable
"
"
" ctrlp
"let g:ctrlp_user_command='find %s -type f | sort'
let g:ctrlp_custom_ignore='\v[\/](\.(git|hg|svn))|.*(pyc|pyo)$'
set wildignore+=*.pyc,*.swp,*.pyo
"
" ariline
"let g:airline#extensions#branch#enabled=1


" nerdtree
nnoremap <F2> :NERDTreeFocus<CR>
vnoremap <F2> :NERDTreeFocus<CR>
nnoremap <leader>f :NERDTreeFocus<CR>
vnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
vnoremap <leader>t :NERDTreeToggle<CR>

" virtualenv
let g:virtualenv_directory='/home/lynch/opt/'

" jedi-vim turn off autocomplete.
"let g:jedi#show_function_definition=1 "deprecateduse
" show_call_signatures
let g:jedi#show_call_signatures=0
let g:jedi#popup_on_dot=1
" toggle jedi popup
nnoremap <F4> :let g:jedi#popup_on_dot=!g:jedi#popup_on_dot<CR>:echo 'enabled/disable jedi popups: ' g:jedi#popup_on_dot<CR>

" make supertab complete fo rc-xc-nonly
"let g:SuperTabDefaultCompletionType="<c-n>"
"let g:SuperTabDefaultCompletionType="context"
"let g:SuperTabContextDefaultCompletionType="<c-n>"

" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
"let g:python_highlight_all=1
"let g:python_version_2=1


let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_definitions_command = "<leader>g"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" fix slow pymode
let g:pymode_folding=0

nnoremap <leader>b A<CR>import ipdb; ipdb.set_trace()

"nnoremap <C-]> :tag<CR>
"
nnoremap <leader>o :CtrlPBufTagAll<CR>
"nnoremap <leader>p :CtrlPTag<CR>

" see plugin search-ctags ~/.vim/plugin/search-ctags.vim
nnoremap T "zyiw:call SearchCTagsArg(@z)<CR>
nnoremap <leader>p :call SearchCTags()<CR>


nnoremap <leader>er :CtrlPMRU<CR>

" tagbar options:
" https://github.com/majutsushi/tagbar/blob/master/plugin/tagbar.vim#L51
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_expand = 1
nnoremap <F8> :TagbarToggle<CR>


