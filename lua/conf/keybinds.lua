local options = { noremap = true }
vim.api.nvim_set_keymap('n', '<Leader>nh', ':noh<CR>', options)
-- fzf
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Files<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fg', ':GFiles packs/<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fc', ':BCommits<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Rg<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fh', ':History<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Buffers<CR>', options)
-- nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>nn', ':NvimTreeFindFile<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NvimTreeToggle<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NvimTreeFocus<CR>', options)
-- rspec
vim.api.nvim_set_keymap('n', '<Leader>rt', ':call RunCurrentSpecFile()<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>rf', ':call RunNearestSpec()<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>rl', ':call RunLastSpec()<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>ra', ':call RunAllSpecs()<CR>', options)
-- git
vim.api.nvim_set_keymap('n', '<Leader>gg', ':GitBlameToggle<CR>', options)
vim.g['gitblame_enabled'] = 0
-- harpoon
vim.keymap.set('n', '<Leader>ha', function() require('harpoon.mark').add_file() end)
vim.keymap.set('n', '<Leader>hh', function() require('harpoon.ui').toggle_quick_menu() end)
vim.keymap.set('n', '<Leader>h2', function() require('harpoon.ui').nav_next() end)
vim.keymap.set('n', '<Leader>h1', function() require('harpoon.ui').nav_prev() end)
-- trouble
vim.api.nvim_set_keymap('n', '<Leader>tt', ':TroubleToggle<CR>', options)

-- copy path to clipboard
vim.keymap.set('n', '<Leader>cp', function()
    local path = vim.fn.expand("%")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {}) 

-- create new file in this directory
-- vim.api.nvim_set_keymap('n', '<Leader>nf', ':e %:p:h/', options)


-- open this file's spec in a new vsplit
vim.api.nvim_set_keymap('n', '<Leader>sp', ':AV<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>sv', ':AS<CR>', options)
