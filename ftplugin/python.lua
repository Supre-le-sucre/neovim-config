local lspconfig = require("lspconfig")
lspconfig.pyright.setup{}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("cmp_buffer")

lspconfig.pyright.setup{
	capabilities = capabilities
}
