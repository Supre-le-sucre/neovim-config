-- I find mason not clean. I prefer using my system package manager to install LSP and formatters
-- However, it requires, sudo privileges for the most part.
-- This configuration allows mason to be installed on specific environnement depending on hostname


-- Thank you https://stackoverflow.com/a/73516721 :3
local function get_hostname()
	local f = io.popen("/bin/hostname")
	if f == nil then
		return "nil"
	end
	local hostname = f:read("*a") or ""
	f:close()
	hostname = string.gsub(hostname, "\n$", "")
	return hostname
end


-- If we are not in a restrained environnement, we should do nothing
if string.find(get_hostname(), "ppti") then
	return {}
end

return {
	"williamboman/mason.nvim",

	dependencies = { "neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim" },

	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			}
		}

	}

}
