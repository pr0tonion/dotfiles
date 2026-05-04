local lint = require("lint")

lint.linters_by_ft = {
	python = { "pylint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("NvimLint", { clear = true }),
	callback = function()
		lint.try_lint()
	end,
})
