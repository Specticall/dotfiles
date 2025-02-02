require("core.options")
require("core.keymaps")

-- Installs plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("core.treesitter"),
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.lualine"),
	require("plugins.telescope"),
	require("plugins.autocompletion"),
	require("plugins.lsp"),
	require("plugins.autoformatting"),
	require("plugins.indent-blankline"),
})
