set shell=/usr/bin/fish

" file:     init.vim
" author:   jokulhaups

" Hidden chars
set listchars=tab:>-,eol:↲,nbsp:¬,extends:»,precedes:«,space:•
set showbreak=↪\

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
set nofoldenable            " Don't automatically fold
set foldlevel=99

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
