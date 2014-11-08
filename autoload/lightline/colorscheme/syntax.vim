" =============================================================================
" Filename: autoload/lightline/colorscheme/syntax.vim
" Version: 0.0
" Author: fouvrai
" License: MIT License
" Last Change: 2014/11/07 18:55:59.
" =============================================================================

function! s:hi(match, groups)
    for group in a:groups
        redir => hi
            silent exec 'hi ' . group
        redir END

        let _ = matchstr(hi, a:match)
        if strlen(_) | return _ | endif
    endfor

    echoerr "No syntax match for " . string(a:groups)
    return '#ff0000'
endfunction

function! s:hifg(...)
    return s:hi('\mguifg=\zs\S\+\ze', a:000)
endfunction

function! s:hibg(...)
    return s:hi('\mguibg=\zs\S\+\ze', a:000)
endfunction

let s:base0  = s:hifg('Normal')     " gui05
let s:base1  = s:hifg('StatusLine') " gui04
let s:base2  = s:hifg('LineNr')     " gui03
let s:base3  = s:hibg('Normal')     " gui00

let s:base03 = s:hifg('Comment')    " gui03
let s:base02 = s:hibg('StatusLine') " gui02
let s:base01 = s:hibg('LineNr')     " gui01
let s:base00 = s:hibg('Normal')     " gui00

let s:red     = s:hifg('Identifier')              " gui08
let s:orange  = s:hifg('Type')                    " gui09
let s:yellow  = s:hibg('Search')                  " gui0A
let s:green   = s:hifg('String')                  " gui0B
let s:cyan    = s:hifg('vimIsCommand', 'Special') " gui0C
let s:blue    = s:hifg('Function')                " gui0D
let s:magenta = s:hifg('Keyword')                 " gui0E

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left   = [ [ s:base01, s:blue   ], [ s:base0, s:base02 ] ]
let s:p.normal.middle = [ [ s:base2,  s:base01 ]  ]
let s:p.normal.right  = [ [ s:base01, s:base1  ], [ s:base1, s:base02 ] ]

let s:p.inactive.right  = [ [ s:base02, s:base00 ], [ s:base00, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base0,  s:base02 ]  ]
let s:p.inactive.left   = [ [ s:base0,  s:base02 ], [ s:base00, s:base03 ] ]

let s:p.insert.left  = [ [ s:base01, s:green   ], [ s:base0, s:base02 ] ]
let s:p.visual.left  = [ [ s:base01, s:magenta ], [ s:base0, s:base02 ] ]
let s:p.replace.left = [ [ s:base01, s:orange  ], [ s:base0, s:base02 ] ]

let s:p.tabline.left   = [ [ s:base1,  s:base02 ] ]
let s:p.tabline.tabsel = [ [ s:base00, s:cyan   ] ]
let s:p.tabline.middle = [ [ s:base2,  s:base01 ] ]
let s:p.tabline.right  = copy(s:p.normal.right)

let s:p.normal.error   = [ [ s:red,    s:base02 ] ]
let s:p.normal.warning = [ [ s:yellow, s:base02 ] ]

let g:lightline#colorscheme#syntax#palette = lightline#colorscheme#fill(s:p)

