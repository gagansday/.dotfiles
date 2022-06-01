call plug#begin(stdpath('config') . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ntpeters/vim-better-whitespace'
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'edkolev/tmuxline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'luukvbaal/nnn.nvim'
Plug 'tomtom/tcomment_vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()


" Indention Options
set autoindent                      " New lines inherit the indentation of previous lines.
set expandtab                       " Convert tabs to spaces.
set shiftround                      " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftwidth=4                    " When shifting, indent using four spaces.
set smarttab                        " Insert “tabstop” number of spaces when the “tab” key is pressed.
set tabstop=4                       " Indent using four spaces.

" Search Options
set hlsearch                        " Enable search highlighting.
set ignorecase                      " Ignore case when searching.
set incsearch                       " Incremental search that shows partial matches.
set smartcase                       " Automatically switch search to case-sensitive when search query contains an uppercase letter.

" Performance Options
set complete-=i                     " Limit the files searched for auto-completes.
set lazyredraw                      " Don’t update screen during macro and script execution.

" Text Rendering Options
set display+=lastline               " Always try to show a paragraph’s last line.
set encoding=utf-8                  " Use an encoding that supports unicode.
set fileencoding=utf-8
set linebreak                       " Avoid wrapping a line in the middle of a word.
set scrolloff=8                     " The number of screen lines to keep above and below the cursor.
set sidescrolloff=5                 " The number of screen columns to keep to the left and right of the cursor.
syntax enable                       " Enable syntax highlighting.
set wrap                            " Enable line wrapping.

" User Interface Options
set laststatus=2                    " Always display the status bar.
set ruler                           " Always show cursor position.
set wildmenu                        " Display command line’s tab complete options as a menu.
set tabpagemax=50                   " Maximum number of tab pages that can be opened from the command line.
" set cursorline                      " Highlight the line currently under cursor.
set number                          " Show line numbers on the sidebar.
set relativenumber                  " Show line number on the current line and relative numbers on all other lines.
set noerrorbells                    " Disable beep on errors.
set visualbell                      " Flash the screen instead of beeping on errors.
set mouse=a                         " Enable mouse for scrolling and resizing.
set title                           " Set the window’s title, reflecting the file currently being edited.
set background=dark                 " Use colors that suit a dark background.
set signcolumn=yes

" Code Folding Options
set foldmethod=indent               " Fold based on indention levels.
set foldnestmax=3                   " Only fold up to three nested levels.
set nofoldenable                    " Disable folding by default.

" Miscellaneous Options
set autoread                        " Automatically re-read files if unmodified inside Vim.
set backspace=indent,eol,start      " Allow backspacing over indention, line breaks and insertion start.
set backupdir=~/.cache/vim          " Directory to store backup files.
set confirm                         " Display a confirmation dialog when closing an unsaved file.
set dir=~/.cache/vim                " Directory to store swap files.
set formatoptions+=j                " Delete comment characters when joining lines.
set hidden                          " Hide files in the background instead of closing them.
set history=1000                    " Increase the undo limit.
set nomodeline                      " Ignore file’s mode lines; use vimrc configurations instead.
set noswapfile                      " Disable swap files.
set nrformats-=octal                " Interpret octal as decimal when incrementing numbers.
" set spell                         " Enable spellchecking.
set wildignore+=.pyc,.swp           " Ignore files matching these patterns when opening files based on a glob pattern.

set mouse=a                         " enable mouse support
set wildmenu                        " visual autocomplete for command menu
syntax enable
filetype indent on                  " load filetype-specific indent files

" no more *.swap files
set nobackup
set nowritebackup

let mapleader=' '                   " leader is space

" Show hidden characters, tabs, trailing whitespace
set list
set listchars=tab:→\ ,trail:·,nbsp:·" Different tab/space stops"


" move vertically by visual line
nnoremap j gj
nnoremap k gk

" open new split panes to right and below
set splitright
set splitbelow

" Transparent background
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

autocmd Filetype vim setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype sass setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype vue setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make setlocal noexpandtab


" Config files
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>ec :CocConfig<CR>
nnoremap <silent> <leader>et :e ~/.tmux.conf<CR>
nnoremap <silent> <leader>ef :e ~/.config/fish/config.fish<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

" colorscheme
colorscheme onedark
let g:airline_theme='onedark'
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set colorcolumn=80,120
highlight ColorColumn ctermbg=238



" Find files using Telescope command-line sugar.
nnoremap <silent> <leader>ff <cmd>Telescope git_files<cr>
nnoremap <silent> <leader>fa <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<cr>

" nnn
lua << EOF
require("nnn").setup()
EOF
nnoremap <silent> <leader>b <cmd>NnnExplorer<cr>
tnoremap <silent> <leader>b <cmd>NnnExplorer<cr>

nnoremap <silent> <leader>ev :e $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader><space> :nohlsearch<cr>
nnoremap <silent> <leader>et :e ~/.tmux.conf<cr>

let g:coc_global_extensions = ['coc-pairs',
            \'coc-css',
            \'coc-emmet',
            \'coc-html',
            \'coc-json',
            \'coc-tsserver',
            \'coc-phpls',
            \'coc-vetur',
            \'coc-python',
            \'coc-blade',
            \'coc-eslint',
            \'coc-tailwindcss',
            \'coc-prettier']


" PHP Intelephense
if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" END PHP Intelephense
