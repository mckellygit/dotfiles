" Vim syntax file
" Language: ECL
" Version: 0.1

if exists("b:current_syntax")
  finish
endif

syn case ignore
syn sync lines=250

syn keyword celBlockCmd abs acos aggregate allnodes apply ascii asin asstring atan atan2 ave case catch choose choosen choosesets clustersize combine correlation cos cosh count covariance cron dataset dedup define denormalize dictionary distribute distributed distribution ebcdic enth error evaluate event eventextra eventname exists exp failcode failmessage fetch fromunicode fromxml getenv getisvalid global graph group hash hash32 hash64 hashcrc hashmd5 having httpcall httpheader if iff index intformat isvalid iterate join keyunicode length library limit ln local log loop map matched matchlength matchposition matchtext matchunicode max merge mergejoin min nofold nolocal nonempty normalize parse pipe power preload process project pull random range rank ranked realformat recordof regexfind regexreplace regroup rejected rollup round roundup row rowdiff sample set sin sinh sizeof soapcall sort sorted sqrt stepped stored sum table tan tanh thisnode topn tounicode toxml transfer transform trim truncate typeof ungroup unicodeorder variance which workunit xmldecode xmlencode xmltext xmlunicode

hi def link celBlockCmd  Statement

let b:current_syntax = "ecl"

" vim: ts=8 sw=2
