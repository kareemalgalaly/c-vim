" C filetype plugin
" Language: C
" Maintainer: Kareem Ahmad

" let b:did_ftplugin if you want to disable the original/bundled plugin

if exists("b:did_ftplugin")
  finish
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load bundled verilog defaults

source $VIMRUNTIME/ftplugin/c.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format options (see fo-table)
"   c = autowrap comments
"   r = (insert) enter continues comments
"   o = (normal) o , O continues comments

"set formatoptions-=ro " moved to vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Expressions for Autocomplete plugin

let s:sol = '^\s*'
let s:eol = '\s*(//.*)?$'
let s:com = '// ' . repeat("-", 50)
let s:hdr = '//*****************************************************************************'

let s:autocomplete_matches = [
 \      ['\v\([^)]*'.s:eol                              , '\N\:\n)'                   ],
 \      ['\v\[[^\]]*'.s:eol                             , '\N\:\n]'                   ],
 \      ['\v\{[^}]*'.s:eol                              , '\N\:\n}'                   ],
 \      ['\vdesc\s+(\w+)\s+(\w+)\s*(.*)$'               , '\!'.s:com.'\n// \1: \2\n// - \3\:\n'.s:com.'\n'              ],
 \      [s:sol.'\v\zs-$'                                , '\!'.s:com                  ],
 \ ]

if exists('*autocomplete#register') | call autocomplete#register("c", s:autocomplete_matches) | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
set foldmethod=syntax

