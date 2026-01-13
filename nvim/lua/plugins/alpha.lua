return {
  'goolord/alpha-nvim',
  opts = {
    position = "center",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[╔══════════════════════════════════════════════════════╗]],
      [[║                                                      ║]],
      [[║  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ║]],
      [[║  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ║]],
      [[║  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ║]],
      [[║  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ║]],
      [[║  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ║]],
      [[║  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ║]],
      [[║                                                      ║]],
      [[╚══════════════════════════════════════════════════════╝]],
      [[                                                        ]],
      [[                                                        ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("ff", "  Find File", ":Telescope find_files <CR>"),
      dashboard.button("fo", "  Recent Files", ":Telescope oldfiles <CR>"),
      dashboard.button("fw", "󰈭  Find Word", ":Telescope live_grep <CR>"),
      dashboard.button("r", "  Restore Session", ":AutoSession restore <CR>"),
      dashboard.button("q", "󰅗  Close Neovim", ":q <CR>")
    }

    dashboard.config.layout = {
      { type = "padding", val = 10 }, -- top padding (increase to move down)
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    dashboard.config.opts.noautocmd = true

    vim.cmd [[autocmd User AlphaReady echo 'ready']]

    alpha.setup(dashboard.config)
  end
};
