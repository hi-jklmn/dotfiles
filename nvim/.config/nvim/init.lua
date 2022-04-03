local confdir = vim.fn.stdpath('config')

vim.cmd('source ' .. confdir .. '/setup.vim')
vim.cmd('source ' .. confdir .. '/keybinds.vim')
require('plugins')

print 'init.lua loaded'
