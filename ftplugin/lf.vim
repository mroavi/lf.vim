if exists("g:lf_ftplugin")
    finish
endif
let b:lf_ftplugin = 1

for key in keys(g:lf#action)
    if type(g:lf#action[key]) == v:t_func
        exec 'tnoremap <nowait><buffer><silent> '.key.' <c-\><c-n>:<c-u>call lf#select_action('.string(g:lf#action[key]).')<cr>'
    else
        exec 'tnoremap <nowait><buffer><silent> '.key.' <c-\><c-n>:<c-u>call lf#select_action("'.g:lf#action[key].'")<cr>'
    endif
endfor

setlocal nospell bufhidden=wipe nobuflisted nonumber
" vim: set sts=4 sw=4 ts=4 et :
