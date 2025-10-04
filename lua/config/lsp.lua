-- local lspconfig = require("lspconfig") is deprecated
local ft = vim.bo.filetype

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("cmp_buffer")


if ft == "c" then
	vim.lsp.config("clangd", {
		capabilities = capabilities
	})
	vim.lsp.enable("clangd")
end

if ft == "python" then
	vim.lsp.config("pyright", {
		capabilities = capabilities
	})
	vim.lsp.enable("pyright")
end

if ft == "lua" then
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
end

if ft == "clojure" then
	vim.lsp.config("clojure_lsp", {
		capabilities = capabilities
	})
	vim.lsp.enable("clojure_lsp")
end

if ft == "ocaml" then
	vim.lsp.config("ocamllsp", {
		capabilities = capabilities,
		autostart = true
	})
	vim.lsp.enable("ocamllsp")
end
