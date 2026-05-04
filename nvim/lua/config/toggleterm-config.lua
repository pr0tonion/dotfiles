require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,

	open_mapping = [[<leader>tt]],
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,

	float_opts = {
		border = "curved",
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.8),
		winblend = 3,
	},

	highlights = {
		FloatBorder = {
			guifg = "#89b4fa",
		},
	},
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>",
	vim.tbl_extend("force", opts, { desc = "Toggle horizontal terminal" }))

-- Exit terminal mode with ESC
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)

-- Navigation in terminal mode (same as tmux)
keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
