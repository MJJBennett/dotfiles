" Deal with extensions first
source ~/.vim/.more/.vim_extensions

" @@ Things that must go at the start of the file.
" Set <Leader> to <Space>
let mapleader=" " 

" @ Keybinds
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
inoremap jj <Esc>
" Move based on visual (not actual) lines
" nnoremap j g
" nnoremap k gk
nnoremap <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
" Spelling
nnoremap <Leader>sp :set spell spelllang=en_ca<CR>
nnoremap <Leader>w z=

" @ Keybinds > Movement
nnoremap <Leader>j Lz.
nnoremap <Leader>k Hz.

" @@ QOL things

" @ Backspace
set backspace=indent,eol,start

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

highlight LineNr ctermbg=Gray
highlight CursorLineNr ctermbg=Gray

" @ Folding
set foldenable
set foldlevelstart=99
" set foldnestmax=10
nnoremap <Leader>f za
set foldmethod=indent

" Mouse!
set mouse=a

" Now add additional stuff
source ~/.vim/.more/.vim_python
source ~/.vim/.more/.vim_more
