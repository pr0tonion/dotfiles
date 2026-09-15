-- Activates a project venv for pyright/ruff, terminals and the debugger (sets VIRTUAL_ENV)
return {
	"linux-cultist/venv-selector.nvim",
	ft = "python",
	keys = { { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Python venv" } },
	opts = {},
}
