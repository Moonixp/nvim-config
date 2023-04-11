-- PACKAGE MANAGEMENT
---------------------

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Telescope
	use("nvim-lua/plenary.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = {
			{
				"nvim-lua/plenary.nvim",
			},
		},
	})

	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})

	-- Telescope Advanced Git Search
	use({
		"aaronhallaert/ts-advanced-git-search.nvim",
		config = function()
			require("telescope").load_extension("advanced_git_search")
		end,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
		},
	})

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate",
	})

	use("nvim-treesitter/playground")

	-- Harpoon
	use("theprimeagen/harpoon")

	-- Undo Tree
	use("mbbill/undotree")

	-- markdown preveiw
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Fugitive
	use("tpope/vim-fugitive")

	-- commentary
	use("tpope/vim-commentary")

	-- Nvim Tree
	use({ "nvim-tree/nvim-tree.lua", dependencies = {
		"nvim-tree/nvim-web-devicons",
	} })

	-- Smoothie
	use("psliwka/vim-smoothie")

	-- Live-server
	use("manzeloth/live-server")

	-- Discord
	use("andweeb/presence.nvim")

	-- autopair
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Function lsp_signature
	use("ray-x/lsp_signature.nvim")

	-- Wilder
	use("gelguy/wilder.nvim")

	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup({ theme = "evil" })
		end,
	})

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
	})

	--[[ Formatter
     use("mhartington/formatter.nvim")
    --]]

	--neoformat
	use("sbdchd/neoformat")

	--clangd format
	use("rhysd/vim-clang-format")

	-- Smart Column
	use({
		"m4xshen/smartcolumn.nvim",
		config = function()
			require("smartcolumn").setup({
				disabled_filetypes = {
					"help",
					"text",
					"markdown",
					"netrw",
					"typescriptreact",
					"php",
					"sh",
				},
			})
		end,
	})
	-- Toggleterm
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup({
				direction = "float",
				float_opts = {
					border = "curved",
				},
			})
		end,
	})

	-- Fidget
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				text = {
					spinner = "bouncing_ball",
				},
				window = {
					border = "shadow",
					blend = 0,
				},
			})
		end,
	})

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})

	--Vgit
	use({ "tanvirtin/vgit.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- Hexokinase ( colors )
	use({ "RRethy/vim-hexokinase", run = "make hexokinase" })

	-- Vim Cool
	use("romainl/vim-cool")

	-- Transparent - allows for toggle
	use("xiyaowong/nvim-transparent")

	-- Colorscheme - Catppuccin
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	-- Colorscheme - Rose Pine
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("rose-pine").setup()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	-- Colorscheme - Zenbones
	use({
		"mcchrish/zenbones.nvim",
		requires = "rktjmp/lush.nvim",
	})

	-- Colorscheme - meh
	use({
		"davidosomething/vim-colors-meh",
	})
	-- Colorschemes - others
	use("EdenEast/nightfox.nvim")

	use("morhetz/gruvbox")

	use("projekt0n/github-nvim-theme")
end)
