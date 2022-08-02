" Vim global plugin for automatically creating, saving, and restoring sessions
" Vim global plugin for automatically creating, saving, and restoring sessions
" per file
" Last Change:  06 June 2017
" Maintainer:   Jacobus Erasmus <info@JacobusErasmus.com>
" License:      This file is placed in the public domain.

if exists("g:savesess")
  finish
endif
let g:savesess = 1

let s:sess_name = expand('%:p:h') . '/.' . expand('%:t') . '.vsess'

function s:LoadSession()
  if filereadable(s:sess_name)
    execute "source " . fnameescape(s:sess_name)
    syntax on
    hi Normal ctermfg=252 ctermbg=none
  endif
endfunction

function SESaveSession()
  execute 'mksession! ' . fnameescape(s:sess_name)
  silent exe '!echo colorscheme '.g:colors_name.' >> '.fnameescape(s:sess_name)
endfunction

function SESaveSessionAndQuit()
  call SESaveSession()
  execute 'wqa'
endfunction

autocmd VimEnter * call s:LoadSession()
nmap <silent> SS :call SESaveSessionAndQuit()<CR>
nmap <silent> Ss :call SESaveSession()<CR>
