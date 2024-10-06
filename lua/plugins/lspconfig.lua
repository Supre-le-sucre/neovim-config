-- I don't want to use mason: most of the time, LSP needs
-- specific config to work, and mason is installing them without care
-- Mason is very good, but often doesn't suit my needs.

return {
	'neovim/nvim-lspconfig',
	lazy = true,
	init = function()
		vim.lsp.handlers["textDocument/publishDiagnostics"] =
			vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
							{ update_in_insert = true })
	end,

	config = function()
		-- We will attach the lsp to the buffer here 
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('lsp-attach',{ clear = true }),
			callback = function(event)
				-- Mapping controls
				local map = function(keys, func, desc, mode)
					mode = mode or 'n'
					vim.keymap.set(mode, keys, func, 
					{ buffer = event.buf, desc = 'LSP: ' .. desc })
				end

				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

				-- Highlighting on hold
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false})
					vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references
					})


					vim.api.nvim_create_autocmd('LspDetach', {
						group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
							end,
					})
				end
			end
		})
	end
}
