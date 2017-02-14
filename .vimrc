
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'dracula/vim'
Plugin 'mbbill/VimExplorer'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Change the color scheme here.
colorscheme PaperColor
set background=dark

" Makes the background transparent. Leave these out if you're not using a transparent
" terminal.
"highlight Normal ctermbg=NONE guibg=NONE
"highlight NonText ctermbg=NONE guibg=NONE

" This is what sets vim to use 24-bit colors. It will also work for any version of neovim
" newer than 0.1.4.
set termguicolors

syntax enable
syntax on
set number
set mouse-=a
set encoding=utf-8
set showcmd                     " display incomplete commands   
set t_Co=256

nnoremap <Tab> <c-w>w
nnoremap <S-Tab> <c-w>W
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"if &term =~ '256color'
"  " disable Background Color Erase (BCE) so that color schemes
"  " render properly when inside 256-color tmux and GNU screen.
"  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
set t_ut=
"endif

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
set tabstop=4
set softtabstop=4
set shiftwidth=4      			" a tab is two spaces
set expandtab                   " use spaces, not tabs          
set backspace=indent,eol,start  " backspace through everything in insert mode
set paste
set hlsearch                    " highlight matches             
set incsearch                   " incremental searching         
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital l
"set smarttab
"set laststatus=2				" always show status line
set noshowmode

nnoremap <Tab> <c-w>w
nnoremap <S-Tab> <c-w>W

" Highlight whitespace(s) at the end of line.
autocmd VimEnter * :call matchadd('Error', '\s\+$', -1) | call matchadd('Error', '\%u00A0')
