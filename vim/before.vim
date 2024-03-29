" Sometimes we are on a 'tiny' box where our vim is basically vi.
" In those cases, if we don't have eval, we can't really do anything.
" If we don't have eval, we actually can't even evaluate 'has' or if
" statements in general. Fortunately, vim-tiny does recognize that it
" would be ridiculously breaking to not do something for us here - so
" it skips the entire block entirely.
" If we have if statements but not eval, then we probably don't want
" to source extensions anyways. Regardless, this is all kind of silly
" and won't matter except in specific situations.
if has('eval')
    " don't load extensions unless we have vim-plug
    " idk if this works, untested I guess
    runtime autoload/plug.vim
    if exists('*plug#begin')
        source ~/.vim/.more/extensions.vim
    endif
endif
