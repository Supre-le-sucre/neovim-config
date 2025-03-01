local function isWsl()
	if vim.fn.has('wsl') and vim.fn.has("unix") then
		local lines = vim.fn.readfile("/proc/version")
		if string.find(lines[1], "Microsoft") then
			return 1
		end
	end
	return 0
end

if isWsl() then
	vim.opt.clipboard = "unnamedplus"

	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf"
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf"
		},
		cache_enabled = 0,
	}
end
