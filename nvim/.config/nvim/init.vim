set shell=/usr/bin/fish

" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" file:     init.vim
" author:   jokulhaups

" unmap <SPACE> in normal mode
nnoremap <Space> <Nop>

" use <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Set <SPACE> to leader
let mapleader = " "

" Hidden chars
set listchars=tab:>-,eol:↲,nbsp:¬,extends:»,precedes:«,space:•
set showbreak=↪\

""" easy configuration
" edit init.vim
nnoremap <leader>ev :exe 'edit '.stdpath('config').'/init.vim'<cr>
" source init.vim
nnoremap <leader>sv :exe 'source '.stdpath('config').'/init.vim'<cr>

set nocompatible            " turn off vi compatibility
set showmatch               " show matching brackets
" set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set number relativenumber   " enable line numbers
set autoindent              " indent new lines to current amount
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " 80 column line
set mouse=a                 " allow mouse to resize splits
set shiftwidth=4            " Set tab length to 4
set tabstop=4               "
set expandtab               " Insert spaces instead of tabs
set makeprg=./build.sh

filetype plugin indent on   " auto-indents based on file type
syntax on           " turn on syntax highlights

" Force help windows to open in vertical split
autocmd BufWinEnter * if &filetype == 'help' | wincmd L | endif

" Brackets ()()()()
" can look into doing ftplugins later
autocmd Filetype c inoremap ( ()<Esc>i
autocmd Filetype c inoremap (<cr> (<cr><Esc>O
autocmd Filetype c inoremap { {}<Esc>i
autocmd Filetype c inoremap {<cr> {<cr>}<Esc>O
autocmd Filetype c inoremap [ []<Esc>i

" Use w!! to write into a file without permissions
ca w!! w !sudo tee %

" Split management
nnoremap <leader>w- :split<cr>:wincmd j<cr>
nnoremap <leader>w/ :vsplit<cr>:wincmd l<cr>
nnoremap <leader>wd :q<cr>
nnoremap <leader>wm :only<cr>

nnoremap <leader>t- :split<cr>:wincmd j<cr>:terminal<cr>A
nnoremap <leader>t/ :vsplit<cr>:wincmd l<cr>:terminal<cr>A

" Split navigation
nnoremap <leader>wh :wincmd h<cr>
nnoremap <leader>wj :wincmd j<cr>
nnoremap <leader>wk :wincmd k<cr>
nnoremap <leader>wl :wincmd l<cr>

" Move splits (experimental)
nnoremap <leader>wH mL:wincmd h<cr>mH'L:wincmd l<cr>'H:wincmd h<cr>
nnoremap <leader>wJ mK:wincmd j<cr>mJ'K:wincmd k<cr>'J:wincmd j<cr>
nnoremap <leader>wK mJ:wincmd k<cr>mK'J:wincmd j<cr>'K:wincmd k<cr>
nnoremap <leader>wL mH:wincmd l<cr>mL'H:wincmd h<cr>'L:wincmd l<cr>

" Buffer navigation
nnoremap <leader>bj :bn<cr>
nnoremap <leader>bk :bp<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bl :ls<cr>
nnoremap <leader>b1 :1b<cr>
nnoremap <leader>b1 :1b<cr>
nnoremap <leader>b2 :2b<cr>
nnoremap <leader>b3 :3b<cr>
nnoremap <leader>b4 :4b<cr>
nnoremap <leader>b5 :5b<cr>
nnoremap <leader>b6 :6b<cr>
nnoremap <leader>b7 :7b<cr>
nnoremap <leader>b8 :8b<cr>
nnoremap <leader>b9 :9b<cr>
nnoremap <leader>b0 :10b<cr>

" vim-plug
nnoremap <leader>pi :exe 'PlugInstall --sync \| q'<cr>
nnoremap <leader>pu :exe 'PlugUpdate --sync \| q'<cr>
nnoremap <leader>p? :help vim-plug<cr>

" Git (fugitive)
nnoremap <leader>gg :Git<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gd :Git diff<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>g? :help fugitive<cr>

" Line moving
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" CHADTree
nnoremap <leader>ff :CHADopen<cr>
nnoremap <leader>f? :CHADhelp<cr>

call plug#begin('~/.local/share/nvim/plugged')
    " Jellybeans Colorscheme 
    " Plug 'nanotech/jellybeans.vim'
    
    " Icons for statusline
    Plug 'kyazdani42/nvim-web-devicons'

    " Elixir integration
    Plug 'elixir-editors/vim-elixir'

    " Automatically add end in e.g. elixir
    Plug 'tpope/vim-endwise'

    " ~><>
    Plug 'dag/vim-fish'

    " Info docs in vim
    Plug 'HiPhish/info.vim'

    " Let's get keybinding
    Plug 'folke/which-key.nvim'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " " org-mode, wow!
    " Plug 'vhyrro/neorg' | Plug 'nvim-lua/plenary.nvim'

    " Visual yanking
    Plug 'machakann/vim-highlightedyank'

    " Token matching extension
    Plug 'andymass/vim-matchup'

    " Need I say more?
    Plug 'rust-lang/rust.vim'

    " Git
    Plug 'tpope/vim-fugitive'

    " Git gutter
    Plug 'airblade/vim-gitgutter'

    " clang-format
    Plug 'rhysd/vim-clang-format'

    " CHADTree
    Plug 'ms-jpq/chadtree'

    " Lualine
    Plug 'nvim-lualine/lualine.nvim'

    " Buffer-line
    Plug 'akinsho/bufferline.nvim'

    " Material Colorscheme 
    Plug 'marko-cerovac/material.nvim'
call plug#end()

" Automatically install missing plugins
" https://github.com/junegunn/vim-plug/wiki/extra#automatically-install-missing-plugins-on-startup
autocmd VimEnter *
    \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|      PlugInstall --sync | q
    \|  endif

set termguicolors

lua << EOF
require("which-key").setup { }

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

require('nvim-treesitter.configs').setup {
    ensure_installed = { "norg", "haskell", "cpp", "c", "javascript"},
}

require('material').setup {
    high_visibility = {
        darker = true,
    },
    disable = {
        background = true,
    },
}

require('lualine').setup {
    options = { 
        theme = 'material-stealth', 
    }
}

require('bufferline').setup{}
EOF

" Set colorscheme
let g:material_style = "darker"
colorscheme material

echo "Init.vim loaded"
