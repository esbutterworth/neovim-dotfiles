require("null-ls").setup({
    on_attach = require('lsp-format').on_attach,
    sources = {
        require("null-ls").builtins.formatting.rubocop.with({
            command = "bin/rubocop"
        }),
        require("null-ls").builtins.diagnostics.rubocop.with({
            command = "bin/rubocop",
            diagnostics_format = "[#{s}] #{m}"
        }),
    },
})
