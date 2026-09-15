-- Hydra art (from ascii.nvim). Lines are padded to equal width so centering keeps the art aligned.
local hydra = {
	"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆",
	"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦",
	"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄",
	"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄",
	"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀",
	"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄",
	"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄",
	" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄",
	" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄",
	"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆",
	"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃",
}
local width = 0
for _, line in ipairs(hydra) do
	width = math.max(width, vim.fn.strdisplaywidth(line))
end
for i, line in ipairs(hydra) do
	hydra[i] = line .. string.rep(" ", width - vim.fn.strdisplaywidth(line))
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		input = { enabled = true },
		lazygit = { enabled = true },
		-- oil.nvim handles directory buffers
		explorer = { enabled = true, replace_netrw = false },
		picker = {
			enabled = true,
			sources = {
				projects = { dev = { "~/code" } },
				explorer = { exclude = { "node_modules", "venv" } },
			},
		},
		dashboard = {
			enabled = true,
			preset = {
				header = table.concat(hydra, "\n"),
				keys = {
					{ icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
					{ icon = "󰚰 ", key = "u", desc = "Update Plugins", action = ":Lazy update" },
					{ icon = "󰒲 ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
			},
		},
	},
	keys = {
		-- Find (same keys as the old telescope setup)
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
		{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Live grep" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find buffers" },
		{ "<leader>fh", function() Snacks.picker.help() end, desc = "Help tags" },
		{ "<leader>fo", function() Snacks.picker.recent() end, desc = "Recent files" },
		{ "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
		{ "<leader>fr", function() Snacks.picker.lsp_references() end, desc = "LSP references" },
		{ "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "Document symbols" },
		{ "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace symbols" },
		{ "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		{ "<leader>fj", function() Snacks.picker.jumps() end, desc = "Jump list" },
		{ "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
		{ "<leader>fR", function() Snacks.picker.registers() end, desc = "Registers" },
		{ "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
		{ "<leader>ft", function() Snacks.picker.colorschemes() end, desc = "Color schemes" },

		-- Git
		{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git branches" },
		{ "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git commits" },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
		{ "<leader>lg", function() Snacks.lazygit() end, desc = "LazyGit" },

		-- Explorer (replaces nvim-tree)
		{ "<leader>e", function() Snacks.explorer() end, desc = "File explorer" },
		{ "<leader>E", function() Snacks.explorer.reveal() end, desc = "Reveal file in explorer" },
	},
}
