return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",

  config = function()
    local bufferline = require("bufferline")
    local mocha = require("catppuccin.palettes").get_palette("macchiato")
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
        buffer_selected = {
          bg = "#24273a"
        }
      }
    })
  end,
}
