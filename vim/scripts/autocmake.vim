function! AutoCMake()
    if getbufinfo('%')[0].changed
        echoerr "Cannot autoformat, save first"
    else
        call system('cmake-format -i ' . expand('%'))
        edit
    endif
endfunction
