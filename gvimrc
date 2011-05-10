" Jerod Santo's MacVim settings

colorscheme tubster
set guifont=Inconsolata:h17
set linespace=1
set number

if has("gui_running")
  " autohide the toolbar
  set guioptions=egmrt
endif

if has("gui_macvim")
  " replicate textmate CMD-[ and CMD-] for indentation
  nmap <D-[> <<
  nmap <D-]> >>
  vmap <D-[> <gv
  vmap <D-]> >gv
  " replicate textmate CMD-/ for toggling comments
  nmap <D-/> <leader>c<space>
  vmap <D-/> <leader>c<space>
  " use CMD-T
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  " replicate textmate shift arrow in order to select stuff
  nmap <S-up> Vk
  vmap <S-up> k
  nmap <S-right> vl
  vmap <S-right> l
  nmap <S-down> Vj
  vmap <S-down> j
  nmap <S-left> v
  vmap <S-left> h
endif
