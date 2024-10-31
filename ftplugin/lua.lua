local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("cmp_buffer")

lspconfig.lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
		},
	},
	globals = { 'vim' },
}

-- We rerun setup, because it's initialized in filetype, this is sad and not looking good but that's all we have
-- https://www.reddit.com/r/neovim/comments/14cikep/on_nightly_my_lsp_is_not_starting_automatically/
-- https://github.com/neovim/neovim/issues/12688
-- We can't use vim.api.nvim_exec_autocmds("FileType", {}) in here because it will recursively call itself

