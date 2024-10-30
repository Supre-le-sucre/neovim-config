local lspconfig = require("lspconfig")
lspconfig.leanls.setup{}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("cmp_buffer")

lspconfig.leanls.setup{
	 capabilities = capabilities
}


