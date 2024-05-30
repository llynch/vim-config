syn on


" cd ~/.vim/bundle/ && git clone --recursive https://github.com/davidhalter/jedi-vim.git
" source $VIM/vundle-config.vim

" au bufwritepost .vimrc source ~/.vimrc
set clipboard=unnamed

" from here its recycled mapping from my old vimrc

set nocompatible

set t_Co=256 " buggy with consol
"colorscheme desert256
"colorscheme wombat256mod
"colorscheme myWombat
" colorscheme molokai

" make backougrnd color transparent
" hi Normal ctermb=none
hi Normal ctermbg=black ctermfg=white guibg=black guifg=white
" hi NonText ctermbg=none
"hi Comment term=bold cterm=bold gui=bold ctermfg=244 guifg=244
hi Comment cterm=bold ctermfg=lightgray gui=bold guifg=lightgray

let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

function BrightHighlightOn()
  hi CursorLine guibg=darkred
endfunction

function BrightHighlightOff()
  hi CursorLine guibg=#191919
endfunction

set incsearch
" see help status-line, 3 == global
set laststatus=3

set noeb                " error bell
"set vb                  " visual bell
set hlsearch
set et                  " extendtab convert tabs to space
set tabstop=4           " size of tab
set shiftwidth=4
set smarttab
"
set ignorecase          " Search without case
set smartcase           " Match case if upper case in pattern
"                       " (Only valid if ignorecase is set)
"
set autoindent          " Make automatic indentation
set selection=old       " Make the last column be selectable
"
set number              " Show line number
set cursorline          " Hightlight current line
" set cmdheight=2         " Get a 2 line command prompt
set hidden              " Hide buffer when no windows handling it
"
set splitbelow          " on :sp
set splitright          " on :vs

set mouse=a

set nobackup
set nowritebackup
set noswapfile

set wrap

set modeline

" Editing:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-BS> <C-W>
set backspace=indent,eol,start
set whichwrap+=h,l,<,>,[,]

" Navigation:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" backspace go previous position, shift backspace goto next
nnoremap <leader><BS> <C-i>
nnoremap <BS> <C-o>
" Switch to previous and next buffer
nnoremap <M-LEFT> :bp<CR>
nnoremap <M-RIGHT> :bn<CR>
" nnoremap <M-UP> :bm<CR>
"
" eclipse like alt + up and down
nnoremap <M-UP> :m-2<CR>
nnoremap <M-DOWN> :m+1<CR>
inoremap <M-UP> <Esc>:m-2<CR>
inoremap <M-DOWN> <Esc>:m+1<CR>
vnoremap <M-UP> :m'<-2<CR>gv
vnoremap <M-DOWN> :m '>+1<CR>gv
noremap <C-j> :m+<CR>
noremap <C-k> :m-2<CR>
inoremap <C-j> <Esc>:m+<CR>
inoremap <C-k> <Esc>:m-2<CR>
vnoremap <C-j> :m'>+<CR>gv
vnoremap <C-k> :m-2<CR>gv

" open vimrc
"nunmap <leader>e
" focus nvimtree which I hate
nnoremap <leader>evv :e! ~/.vim/vimrc<CR>
nnoremap <leader>evi :e! ~/.config/nvim.nvchad/init.lua<CR>
nnoremap <leader>evb :e! ~/.config/nvim.nvchad/lua/plugins/init.lua<CR>
nnoremap <leader>evd :e! ~/.config/nvim.nvchad/lua/plugins/<CR>
nnoremap <leader>ef :e! ~/.favorites<CR>:exec 'nnoremap <buffer> <CR' . '> Vgf'<CR>

nnoremap <leader>ebb :e! ~/.bashrc<CR>
nnoremap <leader>ebd :e ~/.bashrc.d/<CR>

nnoremap <leader>ec :e %:p:h<CR>
nnoremap <leader>e. :cd %:p:h<CR>
nnoremap <leader>e.. :cd ..<CR>

" Searching:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader><leader>/ :nohlsearch<CR>:echo "Highlight search removed"<CR>
nnoremap <leader>ar bve"vy:reg v<CR>:exec(':Ag ' . @v )<CR>
nnoremap <leader>l :CtrlPBuffer<CR>

" Format:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" next buffer
nnoremap <TAB> <C-w><C-w>
nnoremap <S-TAB> <C-w>p

" Make indentation keep visual
vnoremap > >gv
vnoremap < <gv
" Make indentation with tabs
inoremap <S-TAB> <ESC>V<gi
vnoremap <S-TAB> <gv
vnoremap <TAB> >gv

"nnoremap <UP> <NOP>
"nnoremap <DOWN> <NOP>
"nnoremap <LEFT> <NOP>
"nnoremap <RIGHT> <NOP>

" Copy Paste:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Append to y register
noremap <leader><leader>y <ESC>:call setreg('y', [])<CR>:echo 'Register y cleared'<CR>
vnoremap <leader>y "Yy:echo 'appended to register y'<CR>
vnoremap <leader>x "Yx:echo 'appended to register y'<CR>
nnoremap <leader>y V"Yy:appended to register y<CR>
nnoremap <leader>Y V"Yy:appended to register y<CR>

nnoremap <leader>p "yp

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-c> "+y
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

" setting paste prevent jedi-vim from working :(
" set paste
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>


" TERMINAL
"""""""""""""""""""""""""""""""""''
:tnoremap <Esc> <C-\><C-n>

nnoremap <F3> :cnext<CR>
nnoremap <F5> :exec(getline('.'))<CR>:echo 'vim executed: ' getline('.')<CR>
nnoremap <F6> :echo system(getline('.'))<CR>

" make mp3 file ungzippable (.mp3 files are part of buildozer files for
" android development.)
" inspired from: /usr/share/vim/vim74/plugin/tarPlugin.vim
au BufReadCmd *.mp3 call tar#Browse(@%)

" Dont let trailing spaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.vim,*.html,*.tex,*.haml,*.mako,*.css,*.js match ERROR /\s\+$/

" a python plugins seems to force files not to be wraped. all files should
" wrap
au BufRead,BufNewFile * :set wrap

function! Remove_bad_whitespaces()
    execute "normal mz"
    silent! %s/\s\+$//g
    execute "normal 'z"
endfunction
au BufWrite *.py,*.pyw,*.c,*.h,*.vim,*.html,*.tex,*.haml,*.mako,*.css,*.js,*.json :call Remove_bad_whitespaces()

au BufRead,BufNewFile *.haml :setl noai nocin inde=
au BufRead,BufNewFile *.Jenkinsfile :setl filetype=groovy
au BufRead,BufNewFile Jenkinsfile :setl filetype=groovy
au BufRead,BufNewFile Dockerfile.* :setl filetype=dockerfile
au BufRead,BufNewFile *.Dockerfile :setl filetype=dockerfile
au BufRead,BufNewFile *.dockerfile :setl filetype=dockerfile
au BufRead,BufNewFile *.docker :setl filetype=dockerfile
au BufRead,BufNewFile *.js,*.ts,*.vue,*.json,*.yaml :setl tabstop=2 shiftwidth=2
autocmd FileType typescript,typescriptreact compiler tsc
autocmd FileType typescript,typescriptreact set makeprg=make

au FileType fugitive :nmap z =

set tags=./tags
