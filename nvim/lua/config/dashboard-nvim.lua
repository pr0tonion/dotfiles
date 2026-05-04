local dashboard = require("dashboard")
local home = os.getenv("HOME")
local ascii = require("ascii")
dashboard.setup({
	theme = "hyper",
	config = {
		week_header = { enable = true },
		header = ascii.art.misc.hydra.hydra,
		project = { enable = true },
		mru = { limit = 5 },
		shortcut = {
			{ desc = "󰚰 Update", group = "@property", action = "Lazy update", key = "u" },
			{ desc = " Find File", group = "Label", action = "Telescope find_files", key = "f" },
			{ desc = " Find Text", group = "Label", action = "Telescope live_grep", key = "g" },
			{ desc = " Config", group = "Label", action = "edit " .. home .. "/.config/nvim/init.lua", key = "c" },
			{ desc = " Recent Files", group = "Number", action = "Telescope oldfiles", key = "r" },
			{ desc = "󰒲 Quit", group = "String", action = "qa", key = "q" },
		},
	},
})
