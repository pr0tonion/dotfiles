local lint = require("lint")

lint.linters_by_ft = {
	-- Python is linted by the ruff LSP
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("NvimLint", { clear = true }),
	callback = function()
		lint.try_lint()
	end,
})
