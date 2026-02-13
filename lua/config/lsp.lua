-- local lspconfig = require("lspconfig") is deprecated
local ft = vim.bo.filetype

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local util = require("lspconfig.util")
require("cmp_buffer")


vim.lsp.config("clangd", {
	capabilities = capabilities
})
vim.lsp.enable("clangd")

vim.lsp.config("pyright", {
	capabilities = capabilities
})
vim.lsp.enable("pyright")

vim.lsp.config("lua_ls", {
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
})
vim.lsp.enable("lua_ls")

vim.lsp.config("clojure_lsp", {
	capabilities = capabilities
})
vim.lsp.enable("clojure_lsp")

vim.lsp.config("ocamllsp", {
	capabilities = capabilities,
	autostart = true
})
vim.lsp.enable("ocamllsp")

vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
	autostart = true,
	settings = {
		['rust-analyzer'] = {
			check = { command = "clippy" },
			diagnostics = { enable = true }
		}
	}
})
vim.lsp.enable("rust_analyzer")


vim.lsp.config("tsserver",
	{
		filetypes = { "typescript" },
		cmd = { "typescript-language-server", "--stdio" }
	}
)
vim.lsp.enable("tsserver")

vim.lsp.config("astro-ls",
	{
		filetypes = { "astro" },
		cmd = { "astro-ls", "--stdio" },
		init_options = {
			typescript = {},
		},
		before_init = function(_, config)
			if config.init_options and config.init_options.typescript and not config.init_options.typescript.tsdk then
				config.init_options.typescript.tsdk = util.get_typescript_server_path(config.root_dir)
			end
		end,
	}

)
vim.lsp.enable("astro-ls")

vim.lsp.config("tinymist",

	{
		cmd = { "tinymist" },
		filetypes = { "typst" }
	}
)
vim.lsp.enable("tinymist")
