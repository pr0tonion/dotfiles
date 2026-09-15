return {
	"stevearc/oil.nvim",
	lazy = false, -- Needed so `nvim .` opens oil
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = true,
		view_options = { show_hidden = true },
		keymaps = {
			-- Keep <C-h>/<C-l> for tmux/window navigation
			["<C-h>"] = false,
			["<C-l>"] = false,
			["<C-x>"] = { "actions.select", opts = { horizontal = true } },
		},
	},
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
		{ "<leader>pv", "<cmd>Oil<cr>", desc = "Open parent directory" },
	},
}
