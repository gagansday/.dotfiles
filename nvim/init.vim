" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'wakatime/vim-wakatime'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'

" CSS
Plug 'mattn/emmet-vim'
" Plug 'ap/vim-css-color'

" Html
Plug 'valloric/matchtagalways'

" colorschemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'kaicataldo/material.vim'
Plug 'joshdick/onedark.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" automatically reload upon save
if has ('autocmd') " Remain compatible with earlier versions
  augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

syntax enable
filetype indent on      " load filetype-specific indent files

let mapleader=','       " leader is comma

set encoding=UTF-8

set autoindent
set number              " show line numbers
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=2
set expandtab           " tabs are spaces
set smarttab
set cursorline          " highlight current line
set mouse=a             " enable mouse support
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>ec :CocConfig<CR>
nnoremap <leader>ez :e ~/.zshrc<CR>
nnoremap <leader>et :e ~/.tmux.conf<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" enable backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype js setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 expandtab

"let g:material_terminal_italics = 1
"let g:material_theme_style = 'darker'
"colorscheme material

colorscheme onedark
let g:airline_theme='onedark'

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" emmet
let g:user_emmet_leader_key=','

" Html
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \ 'blade' : 1,
      \}

" Global Shortcuts
nnoremap <silent> <leader>b :NERDTreeToggle<CR>
nnoremap <silent> <leader><space> :nohlsearch<CR>
imap jj <Esc>

" open new split panes to right and below
set splitright
set splitbelow

" Fuzzy finder
nnoremap <leader>p :FZF<CR>
nnoremap <C-e> :History<CR>

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

" Ignoring .gitignore files FIXME
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Coc
let g:coc_global_extensions = ['coc-pairs',
      \'coc-css',
      \'coc-html',
      \'coc-json',
      \'coc-prettier',
      \'coc-tsserver',
      \'coc-tailwindcss',
      \'coc-phpls',
      \'coc-vetur',
      \'coc-eslint',
      \'coc-prettier']

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  :Prettier<CR>
nmap <leader>f  :Prettier<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
