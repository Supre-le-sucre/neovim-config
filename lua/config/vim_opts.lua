-- Vim settings to suit preferences

vim.g.have_nerd_font = true
vim.opt.number = true

vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.scrolloff = 10

-- Clipboard takes a while to setup, so we schedule the setup phase for after

vim.schedule(
	function()
		vim.opt.clipboard = 'unnamedplus'
	end
)

-- Disabling netwr for NvimTree

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1


-- Colorscheme adjustments
vim.api.nvim_create_autocmd('ColorScheme', {
	callback = vim.schedule_wrap(function()
		-- Makes barbar transparent
		vim.cmd("hi BufferTabpageFill guibg=None")
		-- NvimTree transparent
		vim.cmd("hi NvimTreeNormal guibg=None")
		vim.cmd("hi NvimTreeWinSeparator guibg=None")
		vim.cmd("hi NvimTreeStatuslineNc guibg=None")
	end),
	group = vim.api.nvim_create_augroup('foo', {}),
})
