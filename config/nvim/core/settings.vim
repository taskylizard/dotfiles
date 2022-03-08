" **************************************************************************** "
"                                                                              "
"                                                       :::      ::::::::      "
"    settings.vim                                     :+:      :+:    :+:      "
"                                                   +:+ +:+         +:+        "
"    By: taskylizard                              +#+  +:+       +#+           "
"                                               +#+#+#+#+#+   +#+              "
"    Created: 2021/12/13 12:13:02 by taskylizard     #+#    #+#                "
"    Updated: 2021/12/13 12:13:02 by taskylizard    ###   ########.fr          "
"                                                                              "
" **************************************************************************** "
" Neovim Settings
set encoding=utf-8
set number relativenumber
syntax enable
set scrolloff=7
set nobackup
set nowritebackup
set noswapfile
let mapleader = ' '
set noshowmode
set hidden
set autoindent smartindent
set clipboard+=unnamedplus
set updatetime=300
set shortmess+=c
set notimeout

" for neovide
set guifont=monospace:h11
let g:neovide_transparency=0.8
let g:neovide_remember_window_size = v:true
let g:neovide_window_floating_opacity = 0
let g:neovide_floating_blur = 0

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
function Neovide_fullscreen()
    if g:neovide_fullscreen == v:true
        let g:neovide_fullscreen=v:false
    else
        let g:neovide_fullscreen=v:true
    endif
endfunction
map <F11> :call Neovide_fullscreen()<cr>

" Performance
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set fileformats=unix,dos,mac

" Enable folding
set foldmethod=indent
set foldlevel=99

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"General plugin settings
let g:rainbow_active =  1
let g:mkdp_echo_preview_url = 1
let g:auto_save = 1
let g:better_escape_interval = 300
let g:dashboard_default_executive = 'telescope'
let g:cursorline_timeout = 200
let g:header_field_author = 'taskylizard'

" Remember mouse position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END
