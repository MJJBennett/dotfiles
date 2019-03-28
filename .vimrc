set softtabstop=4
set tabstop=4
syntax on
set autoindent
set smartindent
set expandtab
set shiftwidth=4

set number
set relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

highlight LineNr ctermbg=Gray
highlight CursorLineNr ctermbg=Gray

inoremap jj <Esc>
