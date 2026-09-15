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
	-- open_mapping uses <leader>, so keep it out of insert/terminal mode (typing " tt" would open a terminal)
	insert_mappings = false,
	terminal_mappings = false,
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

-- Terminal-mode keymaps only in toggleterm buffers, so <Esc> still reaches lazygit and other terminal apps
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("ToggleTermKeymaps", { clear = true }),
	pattern = "term://*toggleterm#*",
	callback = function(event)
		local buf_opts = vim.tbl_extend("force", opts, { buffer = event.buf })

		-- Exit terminal mode with ESC
		keymap("t", "<Esc>", [[<C-\><C-n>]], buf_opts)

		-- Navigation in terminal mode (same as tmux)
		keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], buf_opts)
		keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], buf_opts)
		keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], buf_opts)
		keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], buf_opts)
	end,
})
