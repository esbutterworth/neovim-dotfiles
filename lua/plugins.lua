-- Packer config for plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'

	-- autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'tpope/vim-endwise'
    use { 
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }
    use {
        'lukas-reineke/lsp-format.nvim',
        config = function() require('lsp-format').setup {} end
    }

    -- development
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
    use 'thoughtbot/vim-rspec'
    use 'tpope/vim-rails'
    use {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {}
        end
    }
    use 'nvim-treesitter/nvim-treesitter'


	-- visual plugins
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
    use 'dracula/vim'
	
	-- git related 
    use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'

	-- file browsing
	use 'preservim/nerdtree'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
    use 'jesseleite/vim-agriculture'
    use { 
        'ThePrimeagen/harpoon',
        require('harpoon').setup({
            global_settings = {
                mark_branch = true
            }
        })
    }
end)
