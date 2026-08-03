require("vim._core.ui2").enable({})

vim.g.netrw_banner = 0

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.wrap = false
opt.linebreak = false

opt.splitbelow = true
opt.splitright = true
opt.inccommand = "split"

opt.ignorecase = true
opt.smartcase = true

opt.autoindent = true
opt.smartindent = true

opt.termguicolors = true

opt.clipboard = "unnamedplus"

opt.swapfile = false
opt.backup = false

opt.scrolloff = 10
opt.isfname:append("@-@")
opt.signcolumn = "yes"
opt.cmdheight = 0

opt.pumborder = "rounded"
opt.pumheight = 15
opt.pummaxwidth = 50



opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})

opt.fillchars:append({ eob = " " })

opt.autocomplete = true


