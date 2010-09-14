" Jerod Santo's Vim settings

colorscheme vividchalk

set nocompatible            " no vi compatibility
syntax on                   " Enable syntax highlighting
filetype on                 " Enable filetype detection
filetype indent on          " Enable filetype-specific indenting
filetype plugin on          " Enable filetype-specific plugins
set expandtab               " insert spaces when tab key is pressed
set tabstop=2               " 1 tab == 2 spaces
set shiftwidth=2            " 1 indentaion == 2 spaces
set backspace=2             " start, indent
set nowrap                  " don't wrap text
set nohls                   " turn off highlight on search
set incsearch               " but highlight inline search
set title                   " don't inherit the terminal's title
set wildmenu                " turn on tab completion menu
set wildmode=list:longest   " make tab completion work like shell
set scrolloff=5             " start scrolling viewport 5 lines ahead of cursor
set pastetoggle=<F2>        " hit F2 before paste to avoid craziness
set nofoldenable            " no code folding
set list                    " show invisibles
set listchars=tab:▸\ ,eol:¬ " use same invisibles as TextMate

" ABBREVIATIONS
cabbr nt tabnew
cabbr D NERDTreeToggle

" MAPPINGS
cmap w!! w !sudo tee % > /dev/null

" Replicate textmate CMD-[ and CMD-] for indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Replicate textmate shift arrow/movement in order to select stuff
nmap <S-up> vk
vmap <S-up> k
nmap <S-k> vk
vmap <S-k> k

nmap <S-right> vl
vmap <S-right> l
nmap <S-l> vl
vmap <S-l> l

nmap <S-down> vj
vmap <S-down> j
nmap <S-j> vj
vmap <S-j> j

nmap <S-left> v
vmap <S-left> h
nmap <S-h> vh
vmap <S-h> h

" TEMP FILES
set backupdir=/tmp " centralize temporary files please
set directory=/tmp " partners backupdir setting

runtime macros/matchit.vim " extend % matching to include if/else/etc
