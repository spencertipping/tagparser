" Language: Pickle markup, by Kris Nuttycombe
" Author:   Spencer Tipping <spencer@spencertipping.com>

syn case match

syn region pickleBrackets       matchgroup=pickleBracket start=/\[/ end=/]/ contains=TOP
syn match  pickleData           /\([^|\]\\]\|\\.\)*/ contained contains=TOP containedin=pickleBrackets,pickleGroup nextgroup=pickleMetadata
syn match  pickleMetadata       /|/                  contained nextgroup=pickleActualMetadata
syn match  pickleActualMetadata /\([^|\]\\]\|\\.\)*/ contained contains=TOP

syn match  pickleTag            /@\w\+/

syn region pickleGroup          matchgroup=pickleSpecialBracket start=/@\[/ end=/]/ contains=TOP

hi link pickleTag            Type
hi link pickleBracket        Special
hi link pickleSpecialBracket Special
hi link pickleMetadata       Operator