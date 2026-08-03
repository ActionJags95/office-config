-- vim.pack.add({
--     "https://github.com/rachartier/tiny-inline-diagnostic.nvim"
-- })
--
-- require("tiny-inline-diagnostic").setup({})

vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})
