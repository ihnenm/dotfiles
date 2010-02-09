"syntax match gitLogCommit +^commit \x\{40}+
"highlight link gitLogCommit Statement
"let b:current_syntax="gitlog"
set ft=git
