require("mason-tool-installer").setup({
	ensure_installed = {
		-- Formatters used by conform.nvim (ruff comes from mason-lspconfig)
		"prettierd",
		"stylua",
	},
	auto_update = true,
	run_on_start = true,
})
