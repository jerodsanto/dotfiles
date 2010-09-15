" Jerod Santo's Vim settings

colorscheme vividchalk

" Use pathogen to include all plugins under the ~/.vim/bundle directory
call pathogen#runtime_append_all_bundles()

set nocompatible            " no vi compatibility
syntax on                   " Enable syntax highlighting
filetype on                 " Enable filetype detection
filetype indent on          " Enable filetype-specific indenting
filetype plugin on          " Enable filetype-specific plugins
set expandtab               " insert spaces when tab key is pressed
set tabstop=2               " 1 tab == 2 spaces
set shiftwidth=2            " 1 indentation == 2 spaces
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
set nobackup                " do not backup files
set noswapfile              " also do not create swap files. I save often & use screen

" ABBREVIATIONS
cabbr nt tabnew
cabbr D NERDTreeToggle

" MAPPINGS
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" sudo make me a sandwich
cmap w!! w !sudo tee % > /dev/null

" tcomment invoked via CMD-/
nmap <D-/> gcc " toggle comments for current line
vmap <D-/> gcgv " toggle comments for current region

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
