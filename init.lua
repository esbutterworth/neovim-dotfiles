-- plugins  
require('lsp')
require('plugins')
require('lualine-conf')
require('rspec')
-- require('nvim-cmp')

-- various other settings
vim.api.nvim_command('set number')
vim.api.nvim_command('set noshowmode')
vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set softtabstop=4')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set autoindent')
vim.api.nvim_command('set clipboard=unnamedplus')
vim.api.nvim_command('set ttyfast')

-- mappings
local options = { noremap = true }
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Files<CR>', options)
