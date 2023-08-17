local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', ':vspl | lua vim.lsp.buf.definition()<CR>', bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufops)
    vim.keymap.set('n', '<Leader>R', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>cc', vim.lsp.buf.code_action, bufopts)
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = false
    }
)

require'lspconfig'.sorbet.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {"bin/srb", "tc", "--lsp", "--cache-dir", "sorbet"},
}

require'lspconfig'.ruby_ls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "ruby-lsp" }
}

-- require'lspconfig'.solargraph.setup {
--     on_attach = on_attach,
--     flags = lsp_flags
-- }

require'lspconfig'.tsserver.setup {
    on_attach = on_attach,
    flags = lsp_flags
}
