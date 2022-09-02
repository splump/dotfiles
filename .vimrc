" Be improved
set nocompatible
filetype off

" Plugin manager
" To install plugin manager manually, run:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Install plugin manager automatically if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/NLKNguyen/papercolor-theme.git'
Plug 'https://github.com/baskerville/vim-sxhkdrc.git'
Plug 'https://github.com/robbles/logstash.vim.git'
Plug 'https://github.com/chriskempson/base16-vim.git'
Plug 'https://github.com/robbles/logstash.vim.git'
call plug#end()

" Change the color scheme
colorscheme base16-default-dark
set background=dark

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
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

"highlight LeadingTab ctermbg=blue guibg=blue
"highlight LeadingSpace ctermbg=darkgreen guibg=darkgreen
highlight EvilSpace ctermbg=darkred guibg=darkred
"au Syntax * syn match LeadingTab /^\t\+/
"au Syntax * syn match LeadingSpace /^\ \+/
au Syntax * syn match EvilSpace /\(^\t*\)\@<!\t\+/ " tabs not preceeded by tabs
au Syntax * syn match EvilSpace /[ \t]\+$/ " trailing space

