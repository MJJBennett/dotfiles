" Another note: You might want to enclose this in resolve(), as <sfile> could
" be a symbolic link. See: https://stackoverflow.com/questions/4976776
" Also, you can write vimscripts in Python, which is something to look into.
let vim_scripts_path = expand('<sfile>:p:h')
exec 'source' vim_scripts_path . '/e.vim'

nnoremap <Leader><Leader>e :call Eedit()<CR>
nnoremap <Leader><Leader>fe :call Efind_edit()<CR>
