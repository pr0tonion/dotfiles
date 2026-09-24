-- Window split rotation (was <leader>tk/<leader>th — moved to <leader>w*
-- to free up the <leader>t namespace for terminals)
map("n", "<leader>wk", "<C-w>t<C-w>K", { desc = "Rotate splits to horizontal" })
map("n", "<leader>wh", "<C-w>t<C-w>H", { desc = "Rotate splits to vertical" })

-- Tmux/Window navigation (unified approach)
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")

-- Disable arrow keys
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")

-- Reload current file (not <leader>r, which would make it wait for <leader>rn)
map("n", "<leader>R", ":so %<CR>", { desc = "Source current file" })

-- Keep cursor centered when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Keep cursor centered when jumping
map("n", "<C-o>", "<C-o>zz")
map("n", "<C-i>", "<C-i>zz")

-- Better indenting in visual mode ("x", not "v", so typing in snippet placeholders isn't affected)
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Move lines up/down in visual mode
map("x", "J", ":m '>+1<CR>gv=gv")
map("x", "K", ":m '<-2<CR>gv=gv")

-- Better pasting (don't lose register when pasting over selection)
map("x", "<leader>p", '"_dP')

-- Faster vertical movement
map("n", "<C-d>", "10j")
map("n", "<C-u>", "10k")

-- Folding
map("n", "<Tab>", "za", { desc = "Toggle fold under cursor" })
