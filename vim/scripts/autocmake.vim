function! AutoCMake()
    if getbufinfo('%')[0].changed
        return "Cannot autoformat, save first"
    else
        call system('cmake-format -i ' . expand('%'))
    endif
endfunction
