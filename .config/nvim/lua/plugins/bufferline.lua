vim.pack.add({
	"https://github.com/akinsho/bufferline.nvim",
})

local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "buffers",
		style_preset = bufferline.style_preset.default,
		separator_style = "slant",

		-- Offset to have VS Code like UI
		offsets = {
			{
				filetype = "neo-tree",
				text = "FileExplorer",
				highlight = "Directory",
				text_align = "left",
				seperator = true,
				separator_style = "slant",
			},
		},
	},
	highlights = {
		fill = {
			fg = "#ffffff",
			bg = "#181926",
		},
		background = {
			fg = "#cad3f5",
			bg = "#1e2030",
		},
		close_button = {
			fg = "#ffffff",
			bg = "#1e2030",
		},
		close_button_selected = {
			fg = "#cad3f5",
			bg = "none",
		},
		buffer_selected = {
			fg = "none",
			bg = "none",
		},
		separator_selected = {
			fg = "#181926",
			bg = "none",
		},
		separator = {
			fg = "#181926",
			bg = "#1e2030",
		},
		modified = {
			fg = "#f38ba8",
			bg = "#1e2030",
		},
		modified_selected = {
			fg = "#a6e3a1",
			bg = "none",
		},
	},
})
