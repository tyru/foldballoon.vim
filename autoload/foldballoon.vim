" vim:foldmethod=marker:fen:
scriptencoding utf-8

" Load Once {{{
if get(g:, 'loaded_foldballoon', 0) || &cp
    finish
endif
let g:loaded_foldballoon = 1
" }}}
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}



function! foldballoon#balloonexpr(...)
    let default = s:get_string(a:000, 0, '')
    let maxlnum = s:get_number(a:000, 1, 25)
    let repstr  = s:get_string(a:000, 2, ' ...(truncated)')
    if foldclosed(v:beval_lnum)
        let lines = getline(v:beval_lnum, foldclosedend(v:beval_lnum))
        if len(lines) > maxlnum
            let lines = lines[: maxlnum-1] + [repstr]
        endif
        if has("balloon_multiline")
            return join(lines, "\n")
        else
            return join(lines, " \\n ")
        endif
    else
        return default
    endif
endfunction

function! s:get_string(list, idx, default)
    let ret = get(a:list, a:idx, a:default)
    return type(ret) is type("") ? ret : a:default
endfunction

function! s:get_number(list, idx, default)
    let ret = get(a:list, a:idx, a:default)
    return type(ret) is type(0) ? ret : a:default
endfunction


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
