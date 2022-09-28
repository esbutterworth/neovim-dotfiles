-- Packer config for plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'

    -- development
	use({
        -- why is the config here and not in other file, inconsistent
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup({
				sources = {
					require("null-ls").builtins.formatting.rubocop.with({
						command = "bin/rubocop"
					}),
					require("null-ls").builtins.diagnostics.rubocop.with({
						command = "bin/rubocop",
                        diagnostics_format = "[#{s}] #{m}"
					})
				},
			})
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
    use 'thoughtbot/vim-rspec'

	-- autocompletion
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use 'tpope/vim-endwise'
    use { 
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }
	
	-- visual plugins
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	
	-- git related 
    use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'

	-- file browsing
	use 'preservim/nerdtree'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
    use 'jesseleite/vim-agriculture'
    use 'ThePrimeagen/harpoon'
end)
