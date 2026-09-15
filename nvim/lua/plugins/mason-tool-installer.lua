return {
	'WhoIsSethDaniel/mason-tool-installer.nvim',
	dependencies = { 'mason-org/mason.nvim' },
	config = function()
		require("config.mason-tool-installer")
	end,
}
