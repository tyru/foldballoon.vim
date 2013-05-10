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
    let default = a:0 ? a:1 : ''
    if foldclosed(v:beval_lnum)
        let lines = getline(v:beval_lnum, foldclosedend(v:beval_lnum))
        if has("balloon_multiline")
            return join(lines, "\n")
        else
            return join(lines, " \\n ")
        endif
    else
        return default
    endif
endfunction


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
