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
    -- CoC
    use {'neoclide/coc.nvim', branch = 'release'}
    -- Make packer responsible for itself
    use 'wbthomason/packer.nvim'
    -- Icons for statusline
    use 'kyazdani42/nvim-web-devicons'
    -- Elixir integration
    use 'elixir-editors/vim-elixir'
    -- Automatically add end in e.g. elixir
    use 'tpope/vim-endwise'
    -- ~><>
    use 'dag/vim-fish'
    -- Info docs in vim
    use 'HiPhish/info.vim'
    -- Let's get keybinding
    use {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup {}
        end
    }
    -- The "missing motion" in vim
    use 'justinmk/vim-sneak'
    -- Visual yanking
    use 'machakann/vim-highlightedyank'
    -- Token matching extension
    use 'andymass/vim-matchup'
    -- Need I say more?
    use 'rust-lang/rust.vim'
    -- Git
    use 'tpope/vim-fugitive'
    -- Git gutter
    use 'airblade/vim-gitgutter'
    -- clang-format
    use 'rhysd/vim-clang-format'
    -- CHADTree
    use 'ms-jpq/chadtree'
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
    -- Automatically set up configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
