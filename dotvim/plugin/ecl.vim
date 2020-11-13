" Vim syntax file
" Language:    ECL
" Maintainer:    Mark Kelly

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

autocmd BufNewFile,BufRead *.{ecl} set filetype=ecl

" case is not significant
syn case	ignore

" A bunch of useful ECL keywords
syn keyword eclStatement    join project hash transform output group

syn keyword eclFunction     abs sin cos tan log exp pow

syn keyword eclTodo contained    TODO

"integer number, or floating point number without a dot.
syn match  eclNumber        "\<\d\+\>"
"floating point number, with dot
syn match  eclNumber        "\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  eclNumber        "\.\d\+\>"

" String and Character contstants
syn match   eclSpecial  contained "\\\d\d\d\|\\."
syn region  eclString   start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=eclSpecial

syn region  eclComment          start="REM" end="$" contains=eclTodo
syn region  eclComment          start="^[ \t]*'" end="$" contains=eclTodo
syn region  eclLineNumber       start="^\d" end="\s"
syn match   eclTypeSpecifier    "[a-zA-Z0-9][\$%&!#]"ms=s+1
" Used with OPEN statement
syn match   eclFilenumber       "#\d\+"
"syn sync ccomment eclComment
"syn match   eclMathsOperator   "[<>+\*^/\\=-]"
syn match   eclMathsOperator    "-\|=\|[:<>+\*^/\\]\|AND\|OR"

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link eclLabel            Label
hi def link eclConditional      Conditional
hi def link eclRepeat           Repeat
hi def link eclLineNumber       Comment
hi def link eclNumber           Number
hi def link eclError            Error
hi def link eclStatement        Statement
hi def link eclString           String
hi def link eclComment          Comment
hi def link eclSpecial          Special
hi def link eclTodo             Todo
hi def link eclFunction         Identifier
hi def link eclTypeSpecifier    Type
hi def link eclFilenumber       eclTypeSpecifier
"hi eclMathsOperator term=bold cterm=bold gui=bold

let b:current_syntax = "ecl"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=4

