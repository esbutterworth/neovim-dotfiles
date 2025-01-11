local on_attach = function(client, bufnr)
    require('lsp-format').on_attach(client, bufnr)
end

require('lspconfig').sorbet.setup {
    on_attach = on_attach,
    cmd = {"bin/srb", "tc", "--lsp", "--cache-dir", "sorbet"},
}

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
}
