vim.pack.add({
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/echasnovski/mini.indentscope" },
})

require("ibl").setup({
	indent = {
		char = "│",
		tab_char = "│",
	},
	scope = {
		enabled = false,
	},
})

require("mini.indentscope").setup({
	symbol = "│",
	options = { try_as_border = true },
})
