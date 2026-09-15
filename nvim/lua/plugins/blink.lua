return {
	"saghen/blink.cmp",
	-- Release tags ship a prebuilt fuzzy matcher; main requires Neovim 0.12
	version = "1.*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	opts = {
		-- Same keys as the old nvim-cmp setup
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "cancel", "fallback" },
			-- Enter only confirms an explicitly selected item
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
		},
		completion = {
			list = { selection = { preselect = false, auto_insert = false } },
			menu = { border = "rounded" },
			documentation = { auto_show = true, window = { border = "rounded" } },
		},
		-- Replaces lsp_signature.nvim
		signature = { enabled = true, window = { border = "rounded" } },
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
		cmdline = {
			completion = { menu = { auto_show = true } },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
