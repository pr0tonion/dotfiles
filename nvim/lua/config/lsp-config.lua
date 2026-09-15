local cmp_nvim_lsp = require("cmp_nvim_lsp")
local mason_lspconfig = require("mason-lspconfig")

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Global diagnostics configuration
vim.diagnostic.config({
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.WARN,
		},
	},
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Drop Neovim's default gr* LSP maps so `gr` below fires without waiting
for _, lhs in ipairs({ "grn", "gra", "grr", "gri", "grt" }) do
	pcall(vim.keymap.del, "n", lhs)
end

-- Vim-like LSP keybindings
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })
-- Signature help in insert mode (lsp_signature.nvim handles automatic display)
vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- Diagnostics (vim-like with [ and ])
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>x", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Code actions and formatting
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Apply cmp capabilities to every LSP server
vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"ruff",
	},
})
