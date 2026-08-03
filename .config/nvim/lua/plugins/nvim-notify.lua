vim.pack.add({
	"https://github.com/rcarriga/nvim-notify",
})

local notify = require("notify")

vim.notify = notify
notify.setup({
	stages = "fade_in_slide_out",
	timeout = 1000,
	background_colour = "#000000",
})
notify("Welcome Back!")
