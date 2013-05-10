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



" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
