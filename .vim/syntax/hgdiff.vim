runtime syntax/diff.vim

syntax match hgDiffStatLine /^ .\{-}\zs[+-]\+$/ contains=hgDiffStatAdd,hgDiffStatDelete
syntax match hgDiffStatAdd    /+/ contained
syntax match hgDiffStatDelete /-/ contained

highlight hgDiffStatAdd    ctermfg=2
highlight hgDiffStatDelete ctermfg=5

let b:current_syntax="hgdiff"
