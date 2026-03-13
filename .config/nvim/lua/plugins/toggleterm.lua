return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	opts = {
		vim.keymap.set(
			"n",
			"<leader>th",
			":ToggleTerm direction=horizontal size=20<CR>",
			{ noremap = true, silent = true, desc = "Toggle horizontal terminal" }
		),
		vim.keymap.set(
			"n",
			"<leader>tv",
			":ToggleTerm direction=vertical size=90<CR>",
			{ noremap = true, silent = true, desc = "Toggle vertical terminal" }
		),
		vim.keymap.set(
			"n",
			"<leader>tf",
			":ToggleTerm direction=float<CR>",
			{ noremap = true, silent = true, desc = "Toggle float terminal" }
		),
		vim.keymap.set("t", "<leader><Esc>", [[<C-\><C-n>]]),
	},
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal

		local lazygit = Terminal:new({
			cmd = "lazygit",
			display_name = " LazyGit ",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "curved",
				title_pos = "center",
			},
		})
		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.keymap.set(
			"n",
			"<leader>gl",
			"<cmd>lua _lazygit_toggle()<CR>",
			{ noremap = true, silent = true, desc = "Open LazyGit" }
		)

		local btop = Terminal:new({
			cmd = "btop",
			display_name = " System Monitor ",
			hidden = false,
			direction = "float",
			float_opts = {
				border = "curved",
				title_pos = "center",
			},
		})
		function _btop_toggle()
			btop:toggle()
		end

		vim.keymap.set(
			"n",
			"<leader>m",
			"<cmd>lua _btop_toggle()<CR>",
			{ noremap = true, silent = true, desc = "Open System Monitor (btop)" }
		)

		local codex_cli = Terminal:new({
			cmd = "codex",
			display_name = " Codex CLI ",
			hidden = true,
			direction = "vertical",
			size = 100,
		})
		function _codex_cli_toggle()
			codex_cli:toggle()
		end

		vim.keymap.set(
			"n",
			"<leader>cc",
			"<cmd>lua _codex_cli_toggle()<CR>",
			{ noremap = true, silent = true, desc = "Open Codex-CLI" }
		)

		require("toggleterm").setup({
			shade_temrinals = true,
			shading_factor = 0,
			float_opts = {
				border = "curved",
				title_pos = "center",
			},

			direction = "vertical",
			size = 120,

			highlights = {
				Normal = {
					guibg = "#1e2030",
				},
				NormalFloat = {
					link = "Normal",
				},
			},
		})
	end,
}
