local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cf",
			function() require("conform").format({ async = true }) end,
			mode = { "n", "x" },
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			javascript = prettier,
			javascriptreact = prettier,
			typescript = prettier,
			typescriptreact = prettier,
			json = prettier,
			jsonc = prettier,
			yaml = prettier,
			css = prettier,
			html = prettier,
		},
		default_format_opts = { lsp_format = "fallback" },
		format_on_save = { timeout_ms = 500 },
	},
}
