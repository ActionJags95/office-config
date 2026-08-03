vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer" },
})

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"cssls",
		"dockerls",
		"docker_compose_language_service",
		"emmet_language_server",
		"html",
		"jsonls",
		"ts_ls",
		"lua_ls",
		"marksman",
		"prismals",
		"pylsp",
		"sqlls",
		"taplo",
		"tailwindcss",
		"vimls",
		"yamlls",
		"qmlls",
	},
	automatic_installation = true,
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"black",
		"isort",
		"pylint",
		{ "eslint_d", version = "13.1.2" },
		"shellcheck",
		"js-debug-adapter",
	},
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
