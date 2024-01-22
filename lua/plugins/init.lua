local plugin_spec = {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("catppuccin")
		end,
        opts = require("plugins.configs.catppuccin"),
	},

	{
		"nvim-treesitter/nvim-treesitter",
		name = "treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		event = {
			"BufReadPost",
			"BufNewFile",
		},
        opts = require("plugins.configs.treesitter"),
		config = function(opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{ "nvim-treesitter/playground", lazy = true },


	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
        config = true,
	},

	{
		"nvim-lualine/lualine.nvim",
        name = "lualine",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			optional = true
		},
        opts = require("plugins.configs.lualine"),
	},

	{
		"nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        name = "telescope",
		dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("plugins.configs.telescope")
        end,
	},

    {
        "BareTuna/autoclose.nvim",
        name = "autoclose",
        config = true,
    },


    ---- rust / lsp
    {
        "neovim/nvim-lspconfig",
        name = "lspconfig",
        config = function()
            require("plugins.configs.servers")
        end,
    },
    -- see lsp progress
    {
        "j-hui/fidget.nvim",
        name = "fidget",
        config = true
    },
    {
        "hrsh7th/nvim-cmp",
        name = "cmp",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        event = { "LspAttach", "InsertCharPre" },
        config = function()
            local opts = require("plugins.configs.cmp")
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^3",
        ft = { "rust" },
    },

    {
        "williamboman/mason.nvim",
        config = true,
    },
}

local opts = require("plugins.configs.lazy_nvim")

require("lazy").setup(plugin_spec, opts)
