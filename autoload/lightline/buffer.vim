" =============================================================================
" Filename: autoload/lightline/buffer.vim
" Version: 0.0
" Author: fouvrai
" License: MIT License
" Last Change: 2015/01/20 18:43:45.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! lightline#buffer#filename(n) abort
  let _ = expand('#'.a:n.':t')
  return strlen(_) ? _ : '[No Name]'
endfunction

function! lightline#buffer#modified(n) abort
  return getbufvar(a:n, '&modified') ? '+' : getbufvar(a:n, '&modifiable') ? '' : '-'
endfunction

function! lightline#buffer#readonly(n) abort
  return getbufvar(a:n, '&readonly') ? 'RO' : ''
endfunction

function! lightline#buffer#bufnum(n) abort
  return a:n
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

