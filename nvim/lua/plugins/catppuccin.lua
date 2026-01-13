return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        term_colors = true,
        show_end_of_buffer = false,
      })
    end,
  },
}
