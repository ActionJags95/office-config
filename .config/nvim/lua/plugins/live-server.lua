return {
  "barrett-ruth/live-server.nvim",
  build = "npm add -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  lazy = false,
  config = function()
    require("live-server").setup()

    vim.keymap.set(
      "n",
      "<leader>ls",
      ":LiveServerToggle<CR>",
      { desc = "Toggle live-server in current directory", silent = true, noremap = true }
    )
  end,
}
