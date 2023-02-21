" Vim syntax file
" Language: Enterprise Control Language (ECL)
" Original Author: Nathaniel Graham
" Modified: Mark Kelly

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Case insensitive
syn case ignore

" Scope keywords
syn keyword eclScope IMPORT EXPORT SHARED

" Conditional keywords
syn keyword eclConditional IF CASE MAP CHOOSE REJECTED WHICH

" Operator keywords
syn keyword eclOperator IN BETWEEN

" Regular int like number with - + or nothing in front
syn match eclNumber '\d\+' contained display
syn match eclNumber '[-+]\d\+' contained display

" Floating point number with decimal no E or e (+,-)
syn match eclNumber '\d\+\.\d*' contained display
syn match eclNumber '[-+]\d\+\.\d*' contained display

" Floating point like number with E and no decimal point (+,-)

syn match eclNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
syn match eclNumber '\d[[:digit:]]*[eE][\-+]\=\d\+' contained display

" Floating point like number with E and decimal point (+,-)
syn match eclNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display
syn match eclNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display

" Special structures
syn keyword eclReturn RETURN contained
syn region eclStruct start=/:\=\w*FUNCTION/ end="END" contains=eclReturn
syn region eclStruct start=/:\=\w*RECORD/ end="END" transparent
syn region eclStruct start=/:\=\w*TRANSFORM/ end="END" transparent
syn region eclStruct start=/:\=\w*MODULE/ end="END" transparent

" Other Special structures TODO
" BEGINC++ Structure
" EMBED Structure
" FUNCTIONMACRO Structure
" INTERFACE Structure
" MACRO Structure

" Special keywords
syn keyword Constant FUNCTION RECORD MODULE TRANSFORM END DATASET DICTIONARY INDEX SET OF TYPEOF RECORDOF ENUM

" Built-in value types
syn keyword eclType BOOLEAN UTF8
syn match eclType "^\s*UNSIGNED\d*"
syn match eclType "^\s*STRING\d*"
syn match eclType "^\s*QSTRING\d*"
syn match eclType "^\s*VARSTRING\d*"
syn match eclType "^\s*VARUNICODE\d*"
syn match eclType "^\s*INTEGER\d*"
syn match eclType "^\s*REAL\d*"
syn match eclType "^\s*DECIMAL\d\+_\d\+"

" String
syn region eclString start='\'' skip=/\\'/ end='\''
syn region eclString start='"' skip=/\\"/ end='"'

" Comments
syn keyword eclCommentTodo    contained TODO FIXME XXX TBD NOTE
syn region  eclComment        start=+//+ end=/$/ contains=eclCommentTodo extend keepend
syn region  eclComment        start=+/\*+  end=+\*/+ contains=eclCommentTodo fold extend keepend

" Reserved keywords
syn keyword eclReserved ALL EXCEPT EXPORT GROUP IMPORT KEYED WILD LEFT RIGHT LIKELY UNLIKELY ROWS SELF SHARED SKIP TRUE FALSE COUNTER INDEPENDENT HINT
"syn keyword eclType     COUNTER

" Built-in function keywords
syn keyword Statement ABS ACOS AGGREGATE ALLNODES APPLY ASCII ASIN ASSERT ASSTRING ATAN ATAN2 AVE BUILD CASE CATCH CHOOSE CHOOSEN CHOOSESETS CLUSTERSIZE COMBINE CORRELATION COS COSH COUNT COVARIANCE CRON DEDUP DEFINE DENORMALIZE DISTRIBUTE DISTRIBUTED DISTRIBUTION EBCDIC ENTH ERROR EVALUATE EVENT EVENTNAME EVENTEXTRA EXISTS EXP FAIL FAILCODE FAILMESSAGE FETCH FROMJSON FROMUNICODE FROMXML GETENV GLOBAL GRAPH GROUP HASH HASH32 HASH64 HASHCRC HASHMD5 HAVING HTTPCALL IF IFF INTFORMAT ISVALID ITERATE JOIN KEYDIFF KEYPATCH KEYUNICODE LENGTH LIBRARY LIMIT LN LOADXML LOCAL LOG LOOP MAP MAX MERGE MERGEJOIN MIN NOLOCAL NONEMPTY NORMALIZE NOFOLD NOTHOR NOTIFY ORDERED OUTPUT PARALLEL PARSE PIPE POWER PRELOAD PROCESS PROJECT PULL RANDOM RANGE RANK RANKED REALFORMAT REGEXFIND REGEXFINDSET REGEXREPLACE REGROUP REJECTED ROLLUP ROUND ROUNDUP ROW ROWDIFF SAMPLE SEQUENTIAL SET SIN SINH SIZEOF SOAPCALL SORT SORTED SQRT STEPPED STORED SUM TABLE TAN TANH THISNODE TOJSON TOPN TOUNICODE TOXML TRACE TRANSFER TRIM TRUNCATE UNGROUP UNICODEORDER UNORDERED VARIANCE WAIT WHEN WHICH WORKUNIT XMLDECODE XMLENCODE

let b:current_syntax = "ecl"

hi def link eclComment     Comment
hi def link eclReserved    Constant
hi def link eclKeyword     Statement
hi def link eclFunction    Error
hi def link eclConditional Statement
hi def link eclOperator    Statement
hi def link eclReturn      Statement
hi def link eclStruct      Error
hi def link eclType        Type
hi def link eclString      Constant
hi def link eclNumber      Constant
hi def link eclScope       PreProc

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=4
