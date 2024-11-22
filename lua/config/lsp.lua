local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("cmp_buffer")

lspconfig.clangd.setup {
	capabilities = capabilities
}

lspconfig.pyright.setup {
	capabilities = capabilities
}

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

lspconfig.clojure_lsp.setup {
	capabilities = capabilities
}
