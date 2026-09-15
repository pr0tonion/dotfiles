vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "" -- Keep syntax highlighting on the fold line
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
