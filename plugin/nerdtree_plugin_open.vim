if exists("g:loaded_nerdtree_plugin_open")
    finish
endif
let g:loaded_nerdtree_plugin_open = 1

function! s:callback_name()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . 'callback'
endfunction

function! s:callback()
    try
        let path = g:NERDTreeFileNode.GetSelected().path.str({'escape': 1})
    catch
        return
    endtry

        if !exists("g:nerdtree_plugin_open_cmd")
            echoerr "please set 'g:nerdtree_plugin_open_cmd'  to 'open','gnome-open' or 'xdg-open'"
            return
        endif
        let cmd = g:nerdtree_plugin_open_cmd . " " . path
        call system(cmd)
endfunction

call NERDTreeAddKeyMap({
    \ 'callback': s:callback_name(),
    \ 'quickhelpText': 'open with external programm',
    \ 'key': 'E',
    \ })
