require("nvim-treesitter.configs").setup({
	-- Install parsers for Neovim's bundled languages too, so they match nvim-treesitter's queries
	ensure_installed = {
		"bash", "c", "json", "lua", "markdown", "markdown_inline",
		"python", "query", "toml", "vim", "vimdoc", "yaml",
	},
	auto_install = true,
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
