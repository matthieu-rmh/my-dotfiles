-- This file can be loaded by calling `lua require('plugis')` from your init.vim
--

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'ThePrimeagen/vim-be-good'
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}
	use "mbbill/undotree"
	use "tpope/vim-fugitive"

	use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
	use({'neovim/nvim-lspconfig'})
	use({'hrsh7th/nvim-cmp'})
	use({'hrsh7th/cmp-nvim-lsp'})
	use ({
		"williamboman/mason.nvim", {
            ensure_installed = {'ts_ls', 'rust_analyzer', 'pyright'}
        }
	})
    -- use 'vim-airline/vim-airline'
    use 'williamboman/mason-lspconfig.nvim'
    -- use 'vim-airline/vim-airline-themes'
    use { "scottmckendry/cyberdream.nvim" }
    use "lukas-reineke/indent-blankline.nvim"
    use "lewis6991/gitsigns.nvim"
    use {
        "windwp/nvim-autopairs"
    }
    use({'akinsho/toggleterm.nvim', tag="*"})
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { 'brenoprata10/nvim-highlight-colors', as = "nvim-highlight-colors" }
    use { "tiagovla/tokyodark.nvim", as = "tokyodark" }
    use { "rose-pine/neovim", as = "rose-pine" }
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end)
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)
    use { "vague2k/vague.nvim", as = "vague" }
    use { "mfussenegger/nvim-dap", as = "dap" }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
    use { "christoomey/vim-tmux-navigator" }
    use { "nvim-treesitter/nvim-treesitter-context" }
    use { "LiadOz/nvim-dap-repl-highlights" }
    use {"AlexvZyl/nordic.nvim"}
    use {"mellow-theme/mellow.nvim"}
end)
