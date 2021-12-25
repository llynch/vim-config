" https://github.com/VundleVim/Vundle.vim

filetype off " required


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf'

Plug 'brooth/far.vim'

Plug 'klen/python-mode'
"
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-dispatch'

Plug 'skywind3000/asyncrun.vim'

"Plug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdtree'

Plug 'jmcantrell/vim-virtualenv'

Plug 'davidhalter/jedi-vim'
Plug 'rking/ag.vim'

Plug 'myhere/vim-nodejs-complete'

Plug 'gregsexton/gitv'

Plug 'majutsushi/tagbar'

Plug 'hail2u/vim-css3-syntax'

Plug 'rust-lang/rust.vim'

" Run interactive sheel in vim buffer
" Plug 'wkentaro/conque.vim'

Plug 'mbbill/undotree'

Plug 'will133/vim-dirdiff'
"Plug 'fidian/hexmode.git'

"Plug 'python-rope/ropevim'

"Plug 'ervandew/supertab' " does notauto complete using jedi-vim so better disableit
"Plug 'tarmack/vim-python-ftplugin'
"Plug 'jaredly/vim-debug'
"Plug 'joonty/vdebug'
"
"Plug 'powerline/powerline'
"Plug 'mbbill/undotree'
"Plug 'scrooloose/syntastic'
"Plug 'nvie/vim-flake8'
"Plug 'hdima/python-syntax'
"
Plug 'artur-shaik/vim-javacomplete2'
Plug 'neomake/neomake'

Plug 'junegunn/seoul256.vim'

Plug 'GutenYe/json5.vim'

Plug 'ekalinin/Dockerfile.vim'

call plug#end()
"filetype plugin indent on " required

" Toignorepluginindentchanges,insteaduse:
" filetypepluginon
"
" Briefhelp
" :PlugList
" :PlugInstall
" :PlugSearch foo
" :PlugClean
"

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:pymode=0
let g:pymode_debug=1

" lint
" https://github.com/klen/python-mode/issues/374
"let pymode_lint_checkers=['pyflakes','pep8','mccabe']
"let g:pymode_lint_checkers=['pycodestyle']
" let g:pymode_lint_async=0
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
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0

" disablepythonfolding
" setfoldlevelstart=10
" setnofoldenable
"
"
" ctrlp
"let g:ctrlp_user_command='find %s -type f | sort'
let g:ctrlp_custom_ignore='\v[\/](\.(git|hg|svn))|.*(pyc|pyo)$'
set wildignore+=*.pyc,*.swp,*.pyo
let g:ctrlp_match_func = { 'match': 'GoodMatch' }
let g:ctrlp_extensions = ['ctags']
command! CtrlPCtags call ctrlp#init(ctrlp#ctags#id())
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


" jedi-vim turn off autocomplete.
"let g:jedi#show_function_definition=1 "deprecateduse
" show_call_signatures
let g:jedi#show_call_signatures=0
let g:jedi#popup_on_dot=0
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
let g:jedi#use_tabs_not_buffers = 0

" fix slow pymode
let g:pymode_folding=0

nnoremap <leader>b A<CR>import ipdb; ipdb.set_trace()

"nnoremap <C-]> :tag<CR>
"
nnoremap <leader>o :CtrlPBufTagAll<CR>
"nnoremap <leader>p :CtrlPTag<CR>

" see plugin search-ctags ~/.vim/plugin/search-ctags.vim
nnoremap T "zyiw:call SearchCTagsArg(@z)<CR>
"nnoremap <leader>p :call SearchCTags()<CR>
nnoremap <leader>p :CtrlPCtags<CR>



nnoremap <leader>er :CtrlPMRU<CR>

" tagbar options:
" https://github.com/majutsushi/tagbar/blob/master/plugin/tagbar.vim#L51
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_expand = 1
nnoremap <F8> :TagbarToggle<CR>
