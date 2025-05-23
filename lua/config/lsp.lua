local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("cmp_buffer")

-- Mason is only used on specific environnement (see lua.plugins.mason)
-- If mason is not there we just setup regularly
if not pcall(require, "mason") then
	-- No mason env

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
else
	require('mason-lspconfig').setup {
		ensure_installed = { "clangd", "pylyzer", "lua_ls" },
	}

	-- Mason env

	lspconfig.clangd.setup {
		capabilities = capabilities
	}

	lspconfig.pylyzer.setup {
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
end
