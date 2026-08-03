vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	-- { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" }
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
})

local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		path_display = { "smart" },
		layout_strategy = "horizontal",
		layout_config = {
			prompt_position = "top",
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

telescope.load_extension("ui-select")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "List all active buffers" })
vim.keymap.set("n", "<leader>ch", builtin.command_history, { desc = "Command history" })
