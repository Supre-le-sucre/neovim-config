return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeOpen" },
		opts = {}, -- This line is needed, if not, NvimTree is a zombie
		dependencies = { "nvim-tree/nvim-web-devicons", }
	},
}
