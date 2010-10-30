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
  " use CMD-T
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
endif