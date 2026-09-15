require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
		-- "custom" hides matches ("exclude" means always show them)
		custom = { '^node_modules$', '^venv$' }
	},
})
