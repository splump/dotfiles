" Be improved
set nocompatible
filetype off

" Change the color scheme
colorscheme PaperColor
set background=dark

" 24 bit colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Disable vim mouse highlighting
set mouse-=a

" Misc settings
syntax enable
set encoding=utf-8
set number
set showcmd
set nowrap                      " don't wrap lines
set tabstop=2
set softtabstop=0
set shiftwidth=2      					" a tab is two spaces
set expandtab                   " use spaces, not tabs
set smarttab
set backspace=indent,eol,start  " backspace through everything in insert mode
" set paste
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital l
set laststatus=1								" always show status line
"set noshowmode

" Bind Tab to switch between panes
nnoremap <Tab> <c-w>w
nnoremap <S-Tab> <c-w>W

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif


" Highlight whitespace(s) at the end of line.
autocmd VimEnter * :call matchadd('Error', '\s\+$', -1) | call matchadd('Error', '\%u00A0')

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

highlight LeadingTab ctermbg=blue guibg=blue
highlight LeadingSpace ctermbg=darkgreen guibg=darkgreen
highlight EvilSpace ctermbg=darkred guibg=darkred
au Syntax * syn match LeadingTab /^\t\+/
au Syntax * syn match LeadingSpace /^\ \+/
au Syntax * syn match EvilSpace /\(^\t*\)\@<!\t\+/ " tabs not preceeded by tabs
au Syntax * syn match EvilSpace /[ \t]\+$/ " trailing space

