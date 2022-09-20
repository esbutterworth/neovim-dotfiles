-- plugins  
require('lsp')
require('plugins')
require('lualine-conf')
-- require('rspec')
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

-- mappings should these be in another file or something?
local options = { noremap = true }
vim.api.nvim_set_keymap('n', '<Leader>nh', ':noh<CR>', options)
-- fzf
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Files<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fg', ':GFiles<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Rg<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>frr', ':RgRaw -truby<CR>', options) -- search only ruby files
-- nerdtree
vim.api.nvim_set_keymap('n', '<Leader>nn', ':NERDTreeFind<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>nc', ':NERDTreeClose<CR>', options)
-- rspec
vim.api.nvim_set_keymap('n', '<Leader>rt', ':call RunCurrentSpecFile()<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>rf', ':call RunNearestSpec()<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>rl', ':call RunLastSpec()<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>ra', ':call RunAllSpecs()<CR>', options)
-- git
vim.api.nvim_set_keymap('n', '<Leader>gg', ':GitBlameToggle<CR>', options)
vim.g['gitblame_enabled'] = 0
