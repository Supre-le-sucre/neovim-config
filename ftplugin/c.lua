local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require ("cmp_buffer")

lspconfig.clangd.setup {
	capabilities = capabilities
}
