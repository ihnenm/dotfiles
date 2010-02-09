" Vim color file
" Name:       darkon256.vim
" Maintainer: Matt Ihnen <ihnenm@gmatc.matc.edu>
" Homepage:   http://github.com/ihnenm/darkon256/
"
" This theme will only work in xterm 256 color mode.
" It won't work in 8/16 colour terminals.
"
set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "darkon256"

hi Normal         cterm=NONE   ctermfg=152  ctermbg=NONE

hi IncSearch      cterm=BOLD   ctermfg=232  ctermbg=227
hi Search         cterm=NONE   ctermfg=232  ctermbg=227
hi ErrorMsg       cterm=BOLD   ctermfg=192  ctermbg=NONE
hi WarningMsg     cterm=BOLD   ctermfg=226  ctermbg=NONE
hi ModeMsg        cterm=BOLD   ctermfg=63   ctermbg=NONE
hi MoreMsg        cterm=BOLD   ctermfg=63   ctermbg=NONE
hi Question       cterm=BOLD   ctermfg=208  ctermbg=NONE

hi StatusLine     cterm=BOLD   ctermfg=152  ctermbg=NONE
hi User1          cterm=BOLD   ctermfg=82   ctermbg=NONE
hi User2          cterm=BOLD   ctermfg=21   ctermbg=NONE
hi StatusLineNC   cterm=NONE   ctermfg=152  ctermbg=NONE
hi VertSplit      cterm=NONE   ctermfg=241  ctermbg=NONE

"hi WildMenu       cterm=BOLD   ctermfg= ctermbg=NONE

"hi MBENormal                   ctermfg=  ctermbg=NONE
"hi MBEChanged                  ctermfg=  ctermbg=NONE
"hi MBEVisibleNormal            ctermfg=  ctermbg=NONE
"hi MBEVisibleChanged           ctermfg=  ctermbg=NONE

"hi DiffText       cterm=NONE   ctermfg=  ctermbg=NONE
"hi DiffChange     cterm=NONE   ctermfg=  ctermbg=NONE
"hi DiffDelete     cterm=NONE   ctermfg=  ctermbg=NONE
"hi DiffAdd        cterm=NONE   ctermfg=  ctermbg=NONE

"hi Folded         cterm=NONE   ctermfg=  ctermbg=NONE
"hi FoldColumn     cterm=NONE   ctermfg=  ctermbg=NONE

"hi Directory      cterm=NONE   ctermfg=  ctermbg=NONE
hi LineNr         cterm=NONE   ctermfg=238  ctermbg=NONE
"hi NonText        cterm=BOLD   ctermfg=  ctermbg=NONE
"hi SpecialKey     cterm=BOLD   ctermfg=  ctermbg=NONE
"hi Title          cterm=BOLD   ctermfg=  ctermbg=NONE
"hi Visual         cterm=NONE   ctermfg=  ctermbg=NONE

hi Comment        cterm=NONE   ctermfg=238  ctermbg=NONE
hi Constant       cterm=BOLD   ctermfg=201  ctermbg=NONE
hi String         cterm=BOLD   ctermfg=196  ctermbg=233
hi Error          cterm=NONE   ctermfg=252  ctermbg=196
hi Identifier     cterm=BOLD   ctermfg=165  ctermbg=NONE
hi Ignore         cterm=NONE"
hi Number         cterm=NONE   ctermfg=214  ctermbg=NONE
hi PreProc        cterm=NONE   ctermfg=46     ctermbg=NONE
hi Special        cterm=NONE   ctermfg=214     ctermbg=233
hi SpecialChar    cterm=NONE   ctermfg=214     ctermbg=233
hi Statement      cterm=BOLD   ctermfg=226     ctermbg=NONE
hi Todo           cterm=BOLD   ctermfg=238     ctermbg=NONE
hi Type           cterm=BOLD   ctermfg=39     ctermbg=NONE
hi Underlined     cterm=BOLD   ctermfg=NONE     ctermbg=NONE
"hi TaglistTagName cterm=BOLD   ctermfg=     ctermbg=NONE

if v:version >= 700
    hi Pmenu          cterm=NONE   ctermfg=252   ctermbg=240
    hi PmenuSel       cterm=BOLD   ctermfg=252   ctermbg=232
    hi PmenuSbar      cterm=BOLD   ctermfg=NONE   ctermbg=NONE
    hi PmenuThumb     cterm=BOLD   ctermfg=NONE   ctermbg=NONE

    hi SpellBad       cterm=NONE ctermbg=NONE
    hi SpellRare      cterm=NONE ctermbg=NONE
    hi SpellLocal     cterm=NONE ctermbg=NONE
    hi SpellCap       cterm=NONE ctermbg=NONE
    hi MatchParen     cterm=NONE ctermbg=NONE ctermfg=99
endif

" vim: set et :
