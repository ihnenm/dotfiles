runtime syntax/diff.vim

syntax match hgStatusUntracked /^\?\s\p\+/
syntax match hgStatusNewFile   /^A\s\p\+/
syntax match hgStatusModified  /^M\s\p\+/

highlight link hgStatusUndracked   diffOnly
highlight link hgStatusNewFile     diffAdded
highlight link hgStatusModified    diffChanged

let b:current_syntax="hgstatus"
