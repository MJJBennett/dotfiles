" Initial sources here

" @@ Things that must go at the start of the file.
" Set <Leader> to <Space>
let mapleader=" " 

" @ Keybinds
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
inoremap jj <Esc>
nnoremap ; :
" Move based on visual (not actual) lines
" nnoremap j g
" nnoremap k gk
nnoremap <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
" Spelling
nnoremap <Leader>sp :set spell spelllang=en_ca<CR>
nnoremap <Leader>w z=
" Colemak
nnoremap <Leader><C-K> :so ~/.vim/colemak.vim<CR>

" @ Keybinds > Movement
nnoremap <Leader>j Lz.
nnoremap <Leader>k Hz.
nnoremap <Leader><Leader>j <C-W>j
nnoremap <Leader><Leader>k <C-W>k
nnoremap <Leader><Leader>l <C-W>l
nnoremap <Leader><Leader>h <C-W>h

" @ Keybinds > Extensions

" Autoformatters
vnoremap <C-R><C-F> :ClangFormat<CR>
nnoremap <C-R><C-A> :ClangFormat<CR>
nnoremap <C-J><C-A> :%!prettier %<CR>
autocmd FileType python,typescript,javascript noremap <buffer> <C-R><C-A> :CocCommand prettier.formatFile<CR>
autocmd FileType rust noremap <buffer> <C-R><C-A> :RustFmt<CR>
" cmake-format remap is done in aliases.vim

" Completer / IDE
nnoremap <C-B> :YcmCompleter GoTo<CR>
nnoremap <C-H>g :YcmCompleter GoTo<CR>
nnoremap <C-H>d :YcmCompleter GetDoc<CR>

" @@ QOL things

" @ Backspace
set backspace=indent,eol,start

" @ Sounds - disable beeping
set vb t_vb=

" @ Searching
" Incremental search
set incsearch
" Highlight matches
set hlsearch
" Keybind to unhighlight matches
nnoremap <Leader>h :nohlsearch<CR>

" @ Tab settings
set softtabstop=4
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set expandtab
set clipboard+=unnamed

" @ Also tab settings ;)
"nnoremap <Leader>th :tabprevious<CR>
"nnoremap <Leader>tl :tabnext<CR>
nnoremap <silent> <Leader>th <Cmd>BufferPrevious<CR>
nnoremap <silent> <Leader>tl <Cmd>BufferNext<CR>
nnoremap <silent> <Leader>tj <Cmd>BufferPick<CR>
nnoremap <silent> <Leader>tk <Cmd>BufferClose<CR>

" @ Appearance settings
if !exists("g:syntax_on")
    syntax enable
endif
" showcmd can show you the last command at the bottom
" set showcmd
" cursorline can underline the current ..line
" set cursorline
set showmatch " This moves the cursor back when doing parens

set number
set relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" highlight LineNr ctermbg=Gray
" highlight CursorLineNr ctermbg=Gray

" You can override this in ~/.vim/.more/local_vim
" set bg=light

" @ Folding
if has('folding')
    set foldenable
    set foldlevelstart=99
    " set foldnestmax=10
    nnoremap <Leader>f za
    vnoremap <Leader>f zf
    set foldmethod=indent
endif

" Mouse!
if has('mouse')
    set mouse=a
endif

" Additional vim config sourcing after here
