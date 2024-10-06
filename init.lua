-- This config was done with the help of kickstart.nvim

-- Vim settings to suit preferences
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- Highlights after yanking
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlights text after yanking',
	group = vim.api.nvim_create_augroup('highlights_yank', {clear = true}),
	callback = 
		function()
			vim.highlight.on_yank()
		end,
})

-- Setting up LazyVim

require("config.lazy")
require("plugins.catppuccin")
