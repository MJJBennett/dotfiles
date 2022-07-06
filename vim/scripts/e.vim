function! Efind_edit()
    let param = input('Enter filename: ')
    let efs_result = system('$HOME/programming/install/best_match.py ' . param)
    exe 'vsplit' efs_result
endfunction

function! Eedit()
    let param = input('Enter search parameters: ')
    let e_result = system('$HOME/programming/install/last_edited.py ' . param)
    exe 'vsplit' e_result
endfunction
