local builtin = require('telescope.builtin')

-- More vim-like telescope bindings
-- File operations
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })

-- LSP integration (complement to direct LSP bindings)
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "LSP references" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })

-- Git integration
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })

-- Vim-specific
vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Jump list" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Marks" })
vim.keymap.set("n", "<leader>fR", builtin.registers, { desc = "Registers" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Color schemes" })
