" Language: Pickle markup, by Kris Nuttycombe
" Author:   Spencer Tipping <spencer@spencertipping.com>

syn case match

syn match  pickleStrayError       /[\]|]/

syn region pickleBrackets         matchgroup=pickleBracket start=/\[/  end=/]/ contains=pickleData
syn region pickleGroupBrackets    matchgroup=pickleGroup   start=/@\[/ end=/]/ contains=pickleGroupData

syn match  pickleGroupData        /\([^|\]\\]\|\\.\)*/ contained contains=TOP nextgroup=pickleMetadata
syn match  pickleGroupName        /\w\+/ contained containedin=pickleGroupData

syn match  pickleGroupClose       /@\[\/\w\+\]/
syn match  pickleGroupClose       /@\//

syn match  pickleData             /\([^|\]\\]\|\\.\)*/ contained contains=TOP nextgroup=pickleMetadata
syn region pickleMetadata         matchgroup=pickleMetadataPipe start=/|/ end=/]\@=/ contained containedin=pickleBrackets contains=@pickleMetadataStuff

syn match  pickleTag              /@\w\+/

syn match  pickleMetadataError    /\w\|\[/ contained
syn match  pickleMetadataTag      /@\w\+/ contained
syn region pickleMetadataBrackets matchgroup=pickleBracket start=/\[/ end=/]/ contained contains=@pickleTagStuff

syn cluster pickleTagStuff        add=pickleTag,pickleBrackets,pickleGroupBrackets
syn cluster pickleMetadataStuff   add=pickleMetadataError,pickleMetadataTag,pickleMetadataBrackets

hi link pickleTag                 Identifier
hi link pickleBracket             Special
hi link pickleGroup               Special
hi link pickleGroupName           Identifier
hi link pickleGroupClose          Special
hi link pickleMetadataBrackets    String
hi link pickleMetadataPipe        Operator
hi link pickleMetadataTag         Type
hi link pickleMetadataError       Error
hi link pickleStrayError          Error