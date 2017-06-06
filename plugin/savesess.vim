" Vim global plugin for automatically creating, saving, and restoring sessions
" per file
" Last Change:  06 June 2017
" Maintainer:   Jacobus Erasmus <info@JacobusErasmus.com>
" License:      This file is placed in the public domain.

if exists("g:savesess")
  finish
endif
let g:savesess = 1

function s:LoadSession()
  let s:sess_name = expand('%:p:h') . '/.' . expand('%:t') . '.vsess'
  if filereadable(s:sess_name)
    execute 'so %:p:h/.%:t.vsess'
    hi Normal       ctermfg=252 ctermbg=none
    if bufexists(1)
      for l in range(1, bufnr('$'))
        if bufwinnr(l) == -1
          exec 'sbuffer ' . l
        endif
      endfor
    endif
  endif
endfunction

function s:SaveSession()
  execute 'mksession! %:p:h/.%:t.vsess'
endfunction

autocmd VimEnter * call s:LoadSession()
autocmd VimLeave * call s:SaveSession()
