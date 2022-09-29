" unmap <SPACE> in normal mode
nnoremap <Space> <Nop>

" use <Esc> to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Set <SPACE> to leader
let mapleader = " "

""" --- OUTDATED -----------------------------------
""" easy configuration
" edit init.vim
nnoremap <leader>ev :exe 'edit '.stdpath('config').'/init.lua'<cr>
" source init.vim
nnoremap <leader>sv :exe 'source '.stdpath('config').'/init.lua'<cr>
""" --- /OUTDATED ----------------------------------

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

" Vimtex
nmap <leader>ll <Plug>(vimtex-compile)
nmap <leader>li <Plug>(vimtex-compile-output)

" CoC
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

