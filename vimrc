" Jerod Santo's Vim settings

" make sure screen gets same color treatment as regular xterm
if match($TERM, "screen") != -1
  set term=xterm-256color
endif

colorscheme vividchalk " this will be overridden in gvimrc
set nocompatible       " no vi compatibility
set encoding=utf-8

source ~/.vim/bundles.vim   " Vundle manages plugins

filetype plugin indent on   " Enable filetype plugin and indent detection
syntax on                   " Enable syntax highlighting
set expandtab               " insert spaces when tab key is pressed
set tabstop=2               " 1 tab == 2 spaces
set shiftwidth=2            " 1 indentation == 2 spaces
set backspace=2             " start, indent
set nowrap                  " don't wrap text
set nohls                   " turn off highlight on search
set incsearch               " but highlight inline search
set ignorecase              " case-insensitive search by default
set smartcase               " case-sensitive search if uppcase is used
set gdefault                " global substitution by default
set title                   " don't inherit the terminal's title
set wildmenu                " turn on tab completion menu
set wildmode=list:longest   " make tab completion work like shell
set scrolloff=5             " start scrolling viewport 5 lines ahead of cursor
set pastetoggle=<F2>        " hit F2 before paste to avoid craziness
set nofoldenable            " no folding by default
set foldmethod=syntax       " fold based on language syntax
set foldnestmax=10          " deepest fold is 10 levels
set foldlevel=1             " fold one level at a time
set list                    " show invisibles
set listchars=tab:▸\ ,eol:¬ " use same invisibles as TextMate
set nobackup                " do not backup files
set number                  " show line numbers
set clipboard=unnamed       " copy/paste to clipboard
set noswapfile              " also do not create swap files. I save often & use screen
set laststatus=2            " always show a status line
set statusline=%<\ %f\ %{fugitive#statusline()}%m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

let NERDTreeIgnore=['\.pyc$']
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=DarkGray
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

let mapleader = ","         " this is much easier to type than default \
" run Ack on word under cursor
nnoremap <leader>a :Ack! <C-R><C-W><cr>
" quit just current buffer
nnoremap <leader>q :bd<cr>
" ; is easier than :
nnoremap ; :
" easy access to nerd tree
nnoremap <leader>d :NERDTreeToggle<cr>
" toggles invisibles
nnoremap <leader>i :set nolist!<cr>
" easy pasting in command-line vim
imap <leader>v  <C-O>:set paste<cr><C-r>*<C-O>:set nopaste<cr>

" use tab to navigate curly braces instead of %
nmap <tab> %
vmap <tab> %

" <S-=> (aka - +) aligns variable assignments in visual mode
vnoremap + :Align =<cr>

" easy window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" easy window resizing
nnoremap <M-h> :vertical resize +1<cr>
nnoremap <M-j> :resize -1<cr>
nnoremap <M-k> :resize +1<cr>
nnoremap <M-l> :vertical resize -1<cr>

" sudo make me a sandwich
cmap w!! w !sudo tee % > /dev/null

" replicate textmate shift arrow/movement in order to select stuff
nmap <S-h> vh
vmap <S-h> h
nmap <S-j> vj
vmap <S-j> j
nmap <S-k> vk
vmap <S-k> k
nmap <S-l> vl
vmap <S-l> l

fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'sql\|markdown'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType python setlocal tabstop=4|set shiftwidth=4
au BufNewFile,BufRead *.json setf javascript
au FileType crontab set nobackup nowritebackup
