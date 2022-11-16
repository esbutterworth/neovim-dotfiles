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
        snip({
            trig = 'v2recon',
            dscr = 'boilerplate for v2 reconciler'
        }, { -- doesn't work, this is a shitty plugin ngl
            fmt(
            [[
            module PaymentReconciliations
              module TransactionReconcilersV2::Reconcilers::$%
                class Reconciler < PaymentReconciliations::TransactionReconcilersV2::Reconcilers::BaseReconciler
                  extend T::Sig
                  
                  sig { params(metrics: Metrics).void }
                  def initialize(metrics: Metrics)
                    super(metrics: metrics)
                  end

                  sig do
                    override.params(
                      transaction: BankTransaction
                    ).returns(T::Array[PaymentReconciliations::ReconciliationService::ReconcilableTransmissionTypes])
                  end
                  def get_matching_transmissions(transaction)

                  end

                  sig do
                    override.params(
                      transaction: BankTransaction,
                      transmissions: T::Array[PaymentReconciliations::ReconciliationService::ReconcilableTransmissionTypes]
                    ).void
                  end
                  def perform_side_effects(transaction, transmissions)
                    # no-op for this reconciler
                  end
                end
              end
            end
            ]],
            {
                ins(1)
            },
            { delimiters = "$%" }
            )
        })
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
