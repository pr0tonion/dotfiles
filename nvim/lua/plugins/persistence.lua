return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- Only start saving sessions once a real file is opened
	init = function()
		-- Don't save empty windows or terminals (Claude, toggleterm) into sessions
		vim.opt.sessionoptions:remove({ "blank", "terminal" })
	end,
	opts = {},
	keys = {
		{ "<leader>qs", function() require("persistence").load() end, desc = "Restore session for cwd" },
		{ "<leader>qS", function() require("persistence").select() end, desc = "Select session" },
		{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
		{ "<leader>qd", function() require("persistence").stop() end, desc = "Don't save session on exit" },
	},
}
