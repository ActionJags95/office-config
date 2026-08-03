vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})

local custom_theme = {
	normal = {
		a = {
			bg = "#8aadf4",
			fg = "#24273a",
			gui = "bold",
		},
		b = {
			bg = "#363a4f",
			fg = "#cad3f5",
		},
		c = {
			bg = "#181926",
		},
	},
	insert = {
		a = {
			bg = "#a6da95",
			fg = "#24273a",
		},
	},
	visual = {
		a = {
			bg = "#c6a0f6",
			fg = "#24273a",
		},
	},
	command = {
		a = {
			bg = "#f5a97f",
			fg = "#24273a",
		},
	},
	inactive = {
		c = {
			bg = "#24273a",
		},
	},
}

require("lualine").setup({
	sections = {
		lualine_y = { "lsp_status" },
		lualine_z = { "progress", "location" },
	},
	options = { theme = custom_theme },
})
