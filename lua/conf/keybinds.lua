local options = { noremap = true }
vim.api.nvim_set_keymap('n', '<Leader>nh', ':noh<CR>', options)

-- fzf
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Files<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fg', ':GFiles <CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fc', ':BCommits<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Rg<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fh', ':History<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Buffers<CR>', options)

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>nn', ':NvimTreeFindFile<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NvimTreeToggle<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NvimTreeFocus<CR>', options)

-- git
vim.api.nvim_set_keymap('n', '<Leader>gg', ':GitBlameToggle<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>gfo', ':GitBlameOpenFileURL<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>gco', ':GitBlameOpenCommitURL<CR>', options)
vim.g['gitblame_enabled'] = 0

-- trouble
vim.api.nvim_set_keymap('n', '<Leader>tt', ':Trouble diagnostics toggle<CR>', options)

-- copilot
vim.api.nvim_set_keymap('n', '<Leader>ct', ':Copilot toggle<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>cs', ':Copilot suggestion<CR>', options) -- this doesn't work in normal mode


-- copy path to clipboard
vim.keymap.set('n', '<Leader>cp', function()
    local path = vim.fn.expand("%")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {}) 

-- open this file's spec in a new vsplit
vim.api.nvim_set_keymap('n', '<Leader>sp', ':AV<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>sv', ':AS<CR>', options)

-- lsp definition
vim.api.nvim_set_keymap('n', 'gD', ':vspl | lua vim.lsp.buf.definition()<CR>', options)
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', options)
