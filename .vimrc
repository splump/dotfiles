set nocompatible              " be iMproved, required
filetype off                  " required

" Change the color scheme
colorscheme PaperColor
set background=dark

" 24 bit colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Syntax highlighting
syntax enable

" Numbered lines
set number

"Disable mouse
set mouse-=a

set encoding=utf-8
set showcmd                     " display incomplete commands

" Bind Tab to switch between panes
nnoremap <Tab> <c-w>w
nnoremap <S-Tab> <c-w>W

" Nerdtree stuff
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Bind CTRL+N to toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" ~/.vimrc
" Make Vim recognize XTerm escape sequences for Page and Arrow
" keys combined with modifiers such as Shift, Control, and Alt.
" See http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
if &term =~ 'xterm'
  " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
  execute "set t_kP=\e[5;*~"
  execute "set t_kN=\e[6;*~"
  " Arrow keys http://unix.stackexchange.com/a/34723
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

set nowrap                      " don't wrap lines
set tabstop=2
set shiftwidth=2      			" a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set paste
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital l
set laststatus=1				" always show status line
"set noshowmode

" Highlight whitespace(s) at the end of line.
autocmd VimEnter * :call matchadd('Error', '\s\+$', -1) | call matchadd('Error', '\%u00A0')

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Disable powerline
let g:powerline_loaded = 1
