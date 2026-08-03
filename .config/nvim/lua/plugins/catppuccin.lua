vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
	flavour = "macchiato",
	transparent_background = true,
	integrations = {
		telescope = {
			enabled = true,
		},
	},
})

vim.cmd.colorscheme("catppuccin-nvim")
