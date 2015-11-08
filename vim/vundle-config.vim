" https://github.com/VundleVim/Vundle.vim

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'klen/python-mode'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
"Plugin 'powerline/powerline'
Plugin 'tpope/vim-fugitive'

Plugin 'kien/ctrlp.vim'
"Plugin 'jaredly/vim-debug'
"Plugin 'joonty/vdebug'

Plugin 'scrooloose/nerdtree'

Plugin 'mbbill/undotree'
Plugin 'jmcantrell/vim-virtualenv'

Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab' " does not autocomplete using jedi-vim so better
                            " disable it
Plugin 'rking/ag.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:pymode = 0

" lint
" https://github.com/klen/python-mode/issues/374
"let pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
"let pymode_lint_checkers = ['pyflakes', 'mccabe']
"
" disable lint on write and put in on <F2>
let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
"nnoremap <F2> :PymodeLint<CR>


" configure rope
" https://github.com/python-rope/ropevim#variables
let g:ropevim_local_prefix = '<C-c> r'
let g:ropevim_global_prefix = '<C-x> p'
" disable pymode, its slow on buffer write
let g:pymode_rope = 0
let g:pymode_rope_regenerate_on_write = 0

" disable python folding
"set foldlevelstart=10
"set nofoldenable
"
"
" ctrlp
"let g:ctrlp_user_command = 'find %s -type f | sort'
let g:ctrlp_custom_ignore =  '\v[\/](\.(git|hg|svn))|.*(pyc|pyo)$'
" set wildignore+=*.pyc,*.swp,*.pyo
"
" ariline
let g:airline#extensions#branch#enabled = 1


" nerdtree
nnoremap <F2> :NERDTreeFocus<CR>
vnoremap <F2> :NERDTreeFocus<CR>
nnoremap <leader>f :NERDTreeFocus<CR>
vnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
vnoremap <leader>t :NERDTreeToggle<CR>

" virtualenv
let g:virtualenv_directory = '/home/lynch/opt/'

" jedi-vim turn off autocomplete.
let g:jedi#show_function_definition = 1
let g:jedi#popup_on_dot = 0

" make supertab complete for c-x c-n only
" let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

