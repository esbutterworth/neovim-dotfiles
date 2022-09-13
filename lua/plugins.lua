-- Packer config for plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'neovim/nvim-lspconfig'

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup({
				sources = {
					require("null-ls").builtins.formatting.rubocop.with({
						command = "bin/rubocop_server"
					}),
					require("null-ls").builtins.diagnostics.rubocop.with({
						command = "bin/rubocop_server"
					})
				},
			})
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

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
	use 'airblade/vim-gitgutter'

	-- file browsing
	use 'preservim/nerdtree'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
end)
