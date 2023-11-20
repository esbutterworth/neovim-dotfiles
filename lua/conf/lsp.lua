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

-- require('lspconfig').ruby_ls.setup{
--     on_attach = on_attach,
--     cmd = { "ruby-lsp" }
-- }

lspconfig = require('lspconfig')
configs = require('lspconfig.configs')

if not configs.fuzzy_ls then
  configs.fuzzy_ls = {
    default_config = {
      cmd = {'bin/fuzzy'};
      filetypes = {'ruby'};
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
      end;
      settings = {};
      init_options = {
        allocationType = "ram",
        indexGems = true,
        reportDiagnostics = true
      };
    };
  }
end

require('lspconfig').fuzzy_ls.setup{
    on_attach = on_attach,
}

require('lspconfig').sorbet.setup{
    on_attach = on_attach,
    cmd = {"bin/srb", "tc", "--lsp", "--cache-dir", "sorbet"},
}

require('lspconfig').tsserver.setup {
    on_attach = on_attach,
}

