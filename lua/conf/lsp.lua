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

require('lspconfig').sorbet.setup {
    on_attach = on_attach,
    cmd = {"bin/srb", "tc", "--lsp", "--cache-dir", "sorbet"},
}

require('lspconfig').tsserver.setup {
    on_attach = on_attach,
}

require('lspconfig').mdx_analyzer.setup {
    on_attach = on_attach,
    filetypes = { 'markdown' },
}

require('lspconfig').rubocop.setup {
    on_attach = on_attach,
    cmd = { "bin/rubocop", "--lsp" },
}
