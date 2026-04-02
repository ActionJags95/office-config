return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer",
  },

  config = function()
    require("mason").setup()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilites = require("blink.cmp").get_lsp_capabilities()

    vim.filetype.add({ extension = { ejs = "ejs" } })

    mason_lspconfig.setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "cmake",
        "dockerls",
        "docker_compose_language_service",
        "emmet_language_server",
        "gopls",
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

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
  end,
}
