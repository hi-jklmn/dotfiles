-- Add autocommand to recompile when plugins.lua is written
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Automatically install packer if missing
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1', 
        'https://github.com/wbthomason/packer.nvim', install_path
    })
end

return require('packer').startup(function(use)
    ---- Plumbing ----
    -- Make packer responsible for itself
    use 'wbthomason/packer.nvim'
    -- ~><>
    use 'dag/vim-fish'
    -- Info docs in vim
    use 'HiPhish/info.vim'

    ---- Usability ----
    -- Let's get keybinding
    use {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup {}
        end
    }
    -- The "missing motion" in vim
    use 'justinmk/vim-sneak'
    -- Git
    use 'tpope/vim-fugitive'
    -- CHADTree
    use 'ms-jpq/chadtree'
    -- Snippets
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'


    ---- Code Intelligence ----
    -- CoC
    use {'neoclide/coc.nvim', branch = 'release'}
    -- Elixir integration
    use 'elixir-editors/vim-elixir'
    -- Automatically add end in e.g. elixir
    use 'tpope/vim-endwise'
    -- Extends % to match words
    use 'andymass/vim-matchup'
    -- Need I say more?
    use 'rust-lang/rust.vim'
    -- clang-format
    use 'rhysd/vim-clang-format'
    -- Runs python code and displays the result
    use 'smzm/hydrovim'
    -- LaTeX
    use 'lervag/vimtex'
    vim.cmd[[let g:vimtex_view_method='zathura']]
    vim.cmd[[let g:tex_flavor='latex']]
    --vim.cmd[[set conceallevel=2]]
    vim.cmd[[let g:vimtex_quickfix_enabled=0]]
    vim.cmd[[let g:vimtex_syntax_conceal = {
                  \ 'accents': 0,
                  \ 'ligatures': 0,
                  \ 'cites': 0,
                  \ 'fancy': 0,
                  \ 'greek': 0,
                  \ 'math_bounds': 0,
                  \ 'math_delimiters': 0,
                  \ 'math_fracs': 0,
                  \ 'math_super_sub': 0,
                  \ 'math_symbols': 0,
                  \ 'sections': 0,
                  \ 'styles': 0,
                  \}]]

    ---- Visual ----
    -- IndentLine
    use 'Yggdroot/indentLine'
    -- UI Component library for Neovim
    use 'MunifTanjim/nui.nvim'
    -- Icons for statusline
    use 'kyazdani42/nvim-web-devicons'
    -- Visual yanking
    use 'machakann/vim-highlightedyank'
    -- Git gutter
    use 'airblade/vim-gitgutter'
    -- Lualine
    use { 
        'nvim-lualine/lualine.nvim' ,
        config = function ()
            require('lualine').setup {
                options = { theme = 'material-stealth' }
            }
        end
    }
    -- Buffer-line (Adds tab-like support for open buffers)
    use {
        'akinsho/bufferline.nvim',
        config = function()
            require('bufferline').setup {}
        end
    }
    -- Material Colorscheme 
    use { 
        'marko-cerovac/material.nvim',
        config = function()
            vim.g.material_style = "darker"
            require('material').setup {
                high_visibility = {
                    darker = true,
                },
                disable = {
                    background = true,
                },
            }
            vim.cmd 'colorscheme material'
        end
    }

    ---- Cleanup ----
    -- Automatically set up configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
