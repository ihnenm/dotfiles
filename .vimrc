" --------------------------------------------------------------------- "
"                                                                       "
"               Matt Ihnen's Personal ~/.vimrc                          "
"                                                                       "
"               Last Modified: Mon Feb 08 23:49:31 CST 2010
"                                                                       "
" --------------------------------------------------------------------- "

filetype on
filetype plugin on
filetype indent on
syntax on

" ---------------------------------------------------------------------
"               General Settings For All Filetypes
" ---------------------------------------------------------------------
set nocompatible
"set autoindent
set smartindent
set smartcase
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set showmatch
set showcmd
set vb t_vb=
set ruler
set incsearch
set nobackup
set number
set nowrap
set linebreak
set hlsearch
set undolevels=500
set spelllang=en_us
set noerrorbells
set wrapscan
set autochdir
"set cursorline
set matchtime=2
set mouse=a
set mousemodel=extend
set ttyfast
set modeline
set modelines=1
set showmode
set backspace=indent,eol,start
set background=dark
set list listchars=tab:>·,trail:·
set laststatus=2

" ---------------------------------------------------------------------
"                   Abbreviations
" ---------------------------------------------------------------------
iab DATE <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
iab EMAIL <C-R>="Matt Ihnen <ihnenm@gmatc.matc.edu>"<CR>

" ---------------------------------------------------------------------
"                   Key Mappings (Shortcuts)
" ---------------------------------------------------------------------
" Show Calender
nnoremap <leader>C <ESC>:Calendar<CR>
" Update modifcation time of current file
nnoremap <leader>M  1G/Last Modified:\s*/e+1<CR>CDATE<ESC>
" Reload .vimrc with F3
nnoremap <leader>S <ESC>:source ~/.vimrc<CR>
" Open new tab
nnoremap <leader>t <ESC>:tabnew<CR>
" Clear highlighting on search results by hitting spacebar
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Toggle Invisible Characters
noremap <leader>i <ESC>:set list!<CR> " Toggle invisible chars
" Highlight any text in any filetype that exceeds 80 column limit
nnoremap <silent> <Leader>l
    \ :if exists('w:long_line_match') <Bar>
    \   silent! call matchdelete(w:long_line_match) <Bar>
    \   unlet w:long_line_match <Bar>
    \ elseif &textwidth > 0 <Bar>
    \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
    \ else <Bar>
    \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
    \ endif<CR>

" Remap common typo of using capital letters for write and quit
cmap Q q
cmap W w

" ---------------------------------------------------------------------
"                   Colors Oh, Beautiful Colors
" ---------------------------------------------------------------------
if has('gui_running')
    set statusline=%F%m%r%h%w\ [\ FMT:\ %{&ff}\ ]\ [\ ENC:\ %{&fenc}\ ]\ [\ FT:\%Y\ ]\ [\ POS:\ %04l\ :\ %04v\ ]\ [\ %p%%\ ]\ [\ LEN:\ %L\ ]\ [\ %{strftime('%c')}\ ]
    colorscheme torte
    set guioptions-=T
else
    highlight StatusLine term=bold cterm=bold ctermfg=7  ctermbg=NONE
    set statusline=%F%m%r%h%w\ %3*[%*\ FMT:\ %{&ff}\ %3*]%*\ %3*[%*\ ENC:\ %{&fenc}\ %3*]%*\ %3*[%*\ FT:\ %Y\ %3*]%*\ %3*[%*\ POS:\ %1*%04l%*\ :\ %1*%04v%*\ %3*]%*\ %3*[%*\ %4*%p%%%*\ %3*]%*\ %3*[%*\ LEN:\ %1*%L%*\ %3*]%*\ %3*[%*\ %2*%{strftime('%c')}%*\ %3*]%*

    if &t_Co == 256
        colorscheme darkon256
    else
        highlight Pmenu ctermbg=4
        highlight PmenuSel ctermbg=3
        highlight User1 ctermfg=red ctermbg=NONE
        highlight User3 ctermfg=5 ctermbg=NONE cterm=bold
        highlight User2 ctermfg=2 ctermbg=NONE cterm=bold
        highlight User4 ctermfg=4 ctermbg=NONE cterm=bold
    endif
endif

" ---------------------------------------------------------------------
"                   Ctags Files - add here
" -------------------i--------------------------------------------------
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/qt4
set tags+=~/.vim/tags/crypto++
set tags+=~/.vim/tags/poco
set tags+=./tags

" ---------------------------------------------------------------------
"                   File Type Specific Settings
" ---------------------------------------------------------------------
if has("autocmd")

    " C/C++/C#/Java
    autocmd FileType {c,cpp,java,cs}   inoremap <Tab> <C-R>=SuperCleverTab()<cr>
    autocmd Filetype {c,cpp,java,cs}   inoremap {      {}<Left>
    autocmd FileType {c,cpp,java,cs}   inoremap {<CR>  {<CR>}<Esc>O
    autocmd FileType {c,cpp,java,cs}   inoremap {{     {
    autocmd FileType {c,cpp,java,cs}   inoremap {}     {}
    autocmd FileType {c,cpp,java,cs}   inoremap        (  ()<Left>
    autocmd FileType {c,cpp,java,cs}   inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
    autocmd FileType {c,cpp,java,cs}   inoremap        [  []<Left>
    autocmd FileType {c,cpp,java,cs}   inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
    autocmd FileType {c,cpp,java,cs}   inoremap <expr> <bs> <SID>delpair()
    autocmd FileType {c,cpp,java,cs}   inoremap <expr> " <SID>pairquotes('"')
    autocmd Filetype {c,cpp,java,cs}   inoremap <expr> ' <SID>pairquotes("'")
    autocmd FileType {c,cpp,java,cs}   setlocal formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
    autocmd FileType {c,cpp}           nnoremap <silent><F2> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . <CR>
    autocmd FileType {c,cpp}           nnoremap <silent><F3> :FSSplitAbove <CR>
    autocmd FileType {c,cpp}           nnoremap <silent><F4> :TlistToggle <CR>
    autocmd BufNewFile *.{h,hpp}       call <SID>InsertIncludeGuard()

    " Python
    autocmd Filetype python setlocal autoindent expandtab smarttab smartindent tabstop=4 shiftwidth=4 softtabstop=4
    autocmd Filetype python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class

    " HTML
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2

    " Mail Composition
    autocmd BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail
    autocmd FileType mail setlocal spell textwidth=72

    " Vimrc Editing
    "autocmd BufWritePre,FileWritePre *.vimrc   ks|call LastMod()|'s

    " Regular Old Text Files
    autocmd FileType text setlocal spell wrap linebreak textwidth=80 noautoindent nosmartindent nocindent nolist

endif

" ---------------------------------------------------------------------
"                    Functions for local use in vimrc
" ---------------------------------------------------------------------

" automatically update files modification timestamp
function! LastMod()
    if line("$") > 20
        let l = 20
    else
        let l = line("$")
    endif
    execute "1," . l . "g/Last Modified: /s/Last Modified: .*/Last Modified: " .
    \ strftime("%a %b %d %T %Z %Y")
endfunction

" automatically insert c/c++ include guards
function! s:InsertIncludeGuard()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! i\<CR>\<CR>\<CR>"
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction

" automatically open and close the popup menu
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,menuone,longest

function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

function! s:pairquotes(pair)
    let l:col = col('.')
    let l:line = getline('.')
    let l:chr = l:line[l:col-1]
    if a:pair == l:chr 
        return "\<right>"
    else
        return a:pair.a:pair."\<left>"
endf

function! s:delpair()
    let l:lst = ['""',"''",'{}','[]','()']
    let l:col = col('.')
    let l:line = getline('.')
    let l:chr = l:line[l:col-2 : l:col-1]
    if index(l:lst, l:chr) > -1
        return "\<bs>\<del>"
    else
        let l:chr = l:line[l:col-3:l:col-2]
        if (index(l:lst, l:chr)) > - 1
            return "\<bs>\<bs>"
        endif
        return "\<bs>"
endf

" ---------------------------------------------------------------------
"                        Addon Plugins Settings
" ---------------------------------------------------------------------

" Taglist Plugin Settings
let Tlist_File_Fold_Auto_Close = 1
let Tlist_WinWidth = 40

" Tree Explorerer Settings
let treeExplVertical = 1
let treeExplHidden = 1
let treeExplWinSize = 40

" Pydiction Python Completion
let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'

" Html Plugin Settings
let g:do_xhtml_mappings = 'yes'
let g:html_tag_case = 'lowercase'
let g:no_html_map_override = 'yes'
let g:html_template = '~/.vim/templates/template.html'
let g:html_authorname  = 'Matt Ihnen'
let g:html_authoremail = 'ihnenm@gmatc.matc.edu'
let g:html_bgcolor     = '#FFFFFF'
let g:html_textcolor   = '#000000'
let g:html_linkcolor   = '#0000EE'
let g:html_alinkcolor  = '#FF0000'
let g:html_vlinkcolor  = '#990066'


" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr= 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std"]

