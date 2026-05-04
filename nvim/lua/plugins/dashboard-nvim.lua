return {
	{
		'nvimdev/dashboard-nvim',
		event = "VimEnter",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{
				'MaximilianLloyd/ascii.nvim',
				dependencies = { 'MunifTanjim/nui.nvim' },
			},
		},
		config = function()
			require("config.dashboard-nvim")
		end,
	},
}
