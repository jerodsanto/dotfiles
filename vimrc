" Jerod Santo's Vim settings

" make sure screen gets same color treatment as regular xterm
if match($TERM, "screen") != -1
  set term=xterm-256color
endif

set title              " don't inherit the terminal's title
colorscheme vividchalk " this will be overridden in gvimrc
set nocompatible       " no vi compatibility
set encoding=utf-8
let mapleader = ","    " easier to type than default \

source ~/.vim/bundles.vim   " Vundle manages plugins

filetype plugin indent on   " Enable filetype plugin and indent detection
syntax on                   " Enable syntax highlighting

" indentation
set expandtab    " insert spaces when tab key is pressed
set tabstop=2    " 1 tab == 2 spaces
set shiftwidth=2 " 1 indentation == 2 spaces
set backspace=2  " start, indent
set nowrap       " don't wrap text

" searching and replacing
set nohls      " turn off highlight on search
set incsearch  " but highlight inline search
set ignorecase " case-insensitive search by default
set smartcase  " case-sensitive search if uppcase is used
set gdefault   " global substitution by default

" map fuzzyfinder (CtrlP) plugin
nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$'
\ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2


set wildmenu                " turn on tab completion menu
set wildmode=list:longest   " make tab completion work like shell
set scrolloff=5             " start scrolling viewport 5 lines ahead of cursor
"set autoread                " detect when a file is changed
set list                    " show invisibles
set listchars=tab:▸\ ,eol:¬ " use same invisibles as TextMate

" folding
set nofoldenable            " no folding by default
set foldmethod=syntax       " fold based on language syntax
set foldnestmax=10          " deepest fold is 10 levels
set foldlevel=1             " fold one level at a time
set nobackup                " do not backup files
set number                  " show line numbers
set noswapfile              " also do not create swap files. I save often & use screen
set laststatus=2            " always show a status line
set statusline=%<\ %f\ %{fugitive#statusline()}%m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" copy/paste
set clipboard=unnamed " copy/paste to clipboard
set pastetoggle=<F2>  " hit F2 before paste to avoid craziness
imap <leader>v  <C-O>:set paste<cr><C-r>*<C-O>:set nopaste<cr>

" nerd tree
let NERDTreeIgnore=['\.pyc$']
" easy access to nerd tree
nnoremap <leader>d :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nnoremap <leader>y :NERDTreeFind<cr>

if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=DarkGray
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" run Ack on word under cursor
nnoremap <leader>a :Ack! <C-R><C-W><cr>
" quit just current buffer
nnoremap <leader>q :bd<cr>
" toggles invisibles
nnoremap <leader>i :set nolist!<cr>

" use tab to navigate curly braces instead of %
nmap <tab> %
vmap <tab> %

" <S-=> (aka - +) aligns variable assignments in visual mode
vnoremap + :Align =<cr>

" switch between current and last buffer
nmap <leader><leader> <c-^>

" sudo make me a sandwich
cmap w!! w !sudo tee % > /dev/null

function! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'sql\|markdown'
        return
    endif
    %s/\s\+$//e
endfun

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

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType python setlocal tabstop=4|set shiftwidth=4
autocmd BufNewFile,BufRead *.json setf javascript
autocmd FileType crontab set nobackup nowritebackup
