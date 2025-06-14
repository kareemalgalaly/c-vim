if exists("b:current_syntax")
  finish
endif

syn clear

" Load bundled verilog defaults
source $VIMRUNTIME/syntax/c.vim

" Highlight Mapping

"syn keyword c_label  joshua 
syn match c_pkgtype '\v\w+((::\w+)+|_[cte])>'
syn match c_label   '\v<[A-Z_][A-Z_0-9]+>'

hi link c_pkgtype   cStorageClass
hi link c_label     Constant

let b:current_syntax="c"
