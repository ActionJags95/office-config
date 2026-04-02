local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
  changed_themes = {
    catppuccin = {
      base_30 = {
        black = "#24273a",
        black2 = "#1e2030",
        darker_black = "#1e2030",
        white = "#cad3f5",
        grey = "#5b6078",
        grey_fg = "#939ab7",
        line = "#6e738d",
        red = "#ed8796",
        pink = "#f5bde6",
        green = "#a6da95",
        vibrant_green = "#a6da95",
        blue = "#8aadf4",
        nord_blue = "#8aadf4",
        yellow = "#eed49f",
        dark_purple = "#c6a0f6",
        teal = "#8bd5ca",
        orange = "#f5a97f",
        cyan = "#7dc4e4",
        statusline_bg = "#1e2030",
        one_bg3 = "#363a4f",
        one_bg2 = "#494d64",
        one_bg = "#27273a",
        lightbg = "#363a4f",
        pmenu_bg = "#8aadf4",
      },
      base_16 = {
        base00 = "#24273a",
        base02 = "#5b6078",
        base03 = "#6e738d",
        base0B = "#a6da95",
      },
    },
  },
  hl_override = {
    -- Defaults
    NvDashButtons = { fg = "#f5a97f" },

    -- Text Area Theming
    Folded = { bg = "#24273a" },
    NormalFloat = { bg = "#24273a" },

    -- Telescope Theming
    TelescopeBorder = { fg = "#cad3f5", bg = "none" },
    TelescopePromptBorder = { fg = "#cad3f5", bg = "none" },
    TelescopeResultsTitle = { fg = "#27273a", bg = "#a6da95" },
    TelescopePreviewTitle = { fg = "#27273a", bg = "#8aadf4" },

    -- Blink.cmp Theming
    BlinkCmpMenu = { bg = "none" },
    BlinkCmpMenuBorder = { fg = "#a6adc8", bg = "none" },
    BlinkCmpDoc = { bg = "none" },
    BlinkCmpDocBorder = { fg = "#a6adc8", bg = "none" },

    -- Status line Theming
    StatusLine = { bg = "#1e2030" },
    St_gitIcons = { fg = "#eed49f" },

    -- Bufferline theming
    TbFill = { bg = "#181926" },
    TbBufOff = { bg = "#24273a", fg = "#5b6078" },
    TbBufOffClose = { bg = "#27273a", fg = "#5b6058" },
    TbBufOffModified = { bg = "#27273a", fg = "#ed8796" },

    -- NvimTree Theming
    NvimTreeNormal = { bg = "#1e2030" },
    NvimTreeNormalNC = { bg = "#1e2030" },
  },
}

M.ui = {
  statusline = {
    theme = "default",
    seperator_style = "round",
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "╔══════════════════════════════════════════════════════╗",
    "║                                                      ║",
    "║  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ║",
    "║  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ║",
    "║  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ║",
    "║  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ║",
    "║  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ║",
    "║  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ║",
    "║                                                      ║",
    "╚══════════════════════════════════════════════════════╝",
    "                                                        ",
    "                                                        ",
  },
  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
    { txt = "  Restore Session", keys = "r", cmd = "AutoSession restore" },
    { txt = "󰅗  Close Neovim", keys = "q", cmd = "q" },
    -- more... check nvconfig.lua file for full list of buttons
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}
return M
