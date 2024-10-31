local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Saving
map('n', '<C-s>', '<Cmd>w!<CR>', opts)

-- New files
map('n', '<leader>fn', '<Cmd>enew<CR>', opts)
map('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', opts)

-- Buffer navigation
map('n', '<S-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<S-l>', '<Cmd>BufferNext<CR>', opts)
map('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)

-- Terminal
map('n', '<F7>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<F7>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- NvimTree
map('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', opts)
