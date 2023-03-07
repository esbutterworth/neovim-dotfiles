local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', ':vspl | lua vim.lsp.buf.definition()<CR>', bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufops)
    vim.keymap.set('n', '<Leader>R', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>cc', vim.lsp.buf.code_action, bufopts)
end

require('lspconfig')['sorbet'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {"bin/srb", "tc", "--lsp", "--cache-dir", "sorbet"},
    diagnostics_format = "[#{s} #{m}]" -- does nothing :(
}

require('lspconfig')['solargraph'].setup {
    on_attach = on_attach
}
