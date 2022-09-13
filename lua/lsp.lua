local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
end

require('lspconfig')['sorbet'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {"srb", "tc", "--lsp", "--cache-dir", "sorbet"}
}

