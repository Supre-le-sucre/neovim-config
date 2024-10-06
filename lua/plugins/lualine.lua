active_lsp = function()
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    	if next(clients) == nil then
			return 'None'
		end
	msg = ''
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			-- The active LSP is used for this file type
			msg = msg .. (client.name)
		end
	end
	return msg
end

local colors = require("catppuccin.palettes").get_palette()

return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	
	opts = {
		options = {
			icons_enabled = "auto",
			theme = "catppuccin"
		},
		sections = {
			lualine_x = { 
				{ active_lsp, icon = ' LSP:', color = {fg = colors.pink, bold=true} },
				'encoding', 
				'fileformat', 
				'filetype',
			},
		},
	}, 
}
