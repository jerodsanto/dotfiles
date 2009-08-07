" Jerod Santo's VIM settings

" SENSIBLE DEFAULTS
syntax on           " Enable syntax highlighting
filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins

" GENERAL
colo vividchalk           " change the colorscheme
set nowrap                " don't wrap text
set nohls                 " turn off highlight on search
set title                 " don't inherit the terminal's title
set wildmenu              " turn on tab completion menu
set wildmode=list:longest " make tab completion work like shell
set scrolloff=3           " start scrolling viewport 3 lines ahead of cursor
set incsearch             " inline search highlight

" MACVIM
set guifont=Inconsolata:h16

" TABS AND SPACES
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

" TEMP FILES
set backupdir=/tmp " centralize temporary files please
set directory=/tmp " partners backupdir setting

runtime macros/matchit.vim " extend % matching to include if/else/etc
