-- Packer config for plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
        'neovim/nvim-lspconfig',
        config = function() require('conf.lsp') end,
    }

	-- autocompletion
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
    use {
        'hrsh7th/nvim-cmp',
        config = function() require('conf.cmp') end,
    }

    use 'RRethy/nvim-treesitter-endwise'
    use 'tpope/vim-surround'
    use 'alvan/vim-closetag'
    use { 
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }
    use {
        'lukas-reineke/lsp-format.nvim',
        config = function() require('lsp-format').setup {} end
    }

 	use({
 		"nvimtools/none-ls.nvim",
 		requires = { "nvim-lua/plenary.nvim" },
         config = function() require('conf.null-ls') end,
 	})

    -- development
    use 'tpope/vim-rails'
    use {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {}
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() 
            require('conf.treesitter')
        end
    }
    use { 
        'nvim-treesitter/nvim-treesitter-context',
        config = function() require('treesitter-context').setup {
            max_lines = 5,
            multiline_threshold = 5
        } end
    }

	-- visual plugins
    use 'kyazdani42/nvim-web-devicons'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('conf.lualine') end
	}
    use 'rebelot/kanagawa.nvim'
	
	-- git related 
    use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'

	-- file browsing
    use {
        'nvim-tree/nvim-tree.lua',
        config = function() require('conf.nvim-tree') end
    }
    use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
    use 'jesseleite/vim-agriculture'
end)
