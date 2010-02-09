"syntax match hgLogCommit /\%(^changeset:  *\d\d*:\x\{12\}$\)/
"highlight link hgLogCommit Statement
"let b:current_syntax="hglog"
set ft=hg
