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
						command = "bin/rubocop"
					})
				},
			})
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
    use 'thoughtbot/vim-rspec'

	-- autocompletion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline' 
	use 'hrsh7th/nvim-cmp'
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
	
	-- visual plugins
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	
	-- git related 
    use 'f-person/git-blame.nvim'

	-- file browsing
	use 'preservim/nerdtree'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
    use 'jesseleite/vim-agriculture'
end)
