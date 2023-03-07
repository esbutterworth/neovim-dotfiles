local ls = require('luasnip')
require('luasnip.loaders.from_lua').load({ paths = "~/.config/nvim/snips/" })

local snip = ls.snippet
local text = ls.text_node
local func = ls.function_node
local ins = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local isn = ls.indent_snippet_node

ls.add_snippets(nil, {
    all = {
        snip({
            trig = 'strictheader'
        }, {
            text({'# typed: strict', '# frozen_string_literal: true', ''})
        }),
    },
    ruby = {
        snip({
            trig = 'sdef',
            dscr = 'function with sig'
        }, {
            text('sig { params('),
            ins(1),
            text(').'),
            ins(2),
            text({'}', 'def '}),
            ins(3),
            isn(4, {
                ins(1),
                text('end')
            }) 
        }),
    }
})
