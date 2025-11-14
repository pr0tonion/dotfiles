require("toggleterm").setup({
	-- Size of the terminal
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,

	-- Open terminal in insert mode
	open_mapping = [[<leader>tt]],
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = true,
	direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
	close_on_exit = true,
	shell = vim.o.shell,

	-- Floating terminal configuration
	float_opts = {
		border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.8),
		winblend = 3,
	},

	-- Styling for the terminal window
	highlights = {
		FloatBorder = {
			guifg = "#89b4fa",
		},
	},
})

-- Keymaps for better terminal experience
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Toggle floating terminal
keymap("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>",
	vim.tbl_extend("force", opts, { desc = "Toggle floating terminal" }))

-- Toggle horizontal terminal
keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>",
	vim.tbl_extend("force", opts, { desc = "Toggle horizontal terminal" }))

-- Exit terminal mode with ESC
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)

-- Navigation in terminal mode (same as tmux)
keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

-- Function to create custom terminals for specific tasks
local Terminal = require("toggleterm.terminal").Terminal

-- Create a terminal for running yarn ios (mobile development)
local yarn_ios = Terminal:new({
	cmd = "yarn ios",
	direction = "float",
	hidden = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})

function _YARN_IOS_TOGGLE()
	yarn_ios:toggle()
end

-- Create a terminal for running the backend server
local backend_server = Terminal:new({
	cmd = "uvicorn main:app --reload",
	direction = "float",
	hidden = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})

function _BACKEND_SERVER_TOGGLE()
	backend_server:toggle()
end

-- Keybindings for custom terminals
keymap("n", "<leader>ty", "<cmd>lua _YARN_IOS_TOGGLE()<CR>",
	vim.tbl_extend("force", opts, { desc = "Toggle yarn ios terminal" }))

keymap("n", "<leader>tb", "<cmd>lua _BACKEND_SERVER_TOGGLE()<CR>",
	vim.tbl_extend("force", opts, { desc = "Toggle backend server terminal" }))
