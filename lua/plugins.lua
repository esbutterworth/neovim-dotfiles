-- Packer config for plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
        'neovim/nvim-lspconfig',
        config = function() require('conf.lsp') end,
    }

	-- autocompletion
    use {
        'hrsh7th/cmp-nvim-lsp',
    }
    use {
        'hrsh7th/cmp-buffer',
    }
    use {
        'hrsh7th/cmp-path',
    }
    use {
        'hrsh7th/cmp-cmdline',
    }
    use {
        'hrsh7th/nvim-cmp',
        config = function() require('conf.cmp') end,
    }
    use {
        'L3MON4D3/LuaSnip',
        disable = true
        config = function() require('conf.snips') end,
    }
    use {
        'saadparwaiz1/cmp_luasnip',
        disable = true
    }

    use 'tpope/vim-endwise'
    use 'alvan/vim-closetag'
    use { 
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }
    use {
        'lukas-reineke/lsp-format.nvim',
        config = function() require('lsp-format').setup {} end
    }
    use 'github/copilot.vim'

    -- development
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
        config = function() require('conf.null-ls') end,
	})
    use 'tpope/vim-rails'
    use {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {}
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require('nvim-treesitter').setup {
            ensure_installed = 'maintained'
        } end
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
        'code-biscuits/nvim-biscuits',
        config = function() require('nvim-biscuits').setup({
            show_on_start = true,
            cursor_line_only = true
        }) end
    } 

	-- visual plugins
    use 'kyazdani42/nvim-web-devicons'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('conf.lualine') end
	}
    use { 'dracula/vim', as = 'dracula' }
    use { "ellisonleao/gruvbox.nvim" }
	
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
    use 'axkirillov/hbac.nvim'
end)
