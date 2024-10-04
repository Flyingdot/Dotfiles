local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
	print("Installing lazy.nvim....")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	print("Done.")
end

vim.opt.rtp:prepend(lazypath)

require("flyingdot")

require("lazy").setup({
	{ import = "flyingdot.plugins" },
})

vim.cmd([[
function OpenMarkdownPreview (url)
  execute "silent ! chrome --new-window --app=" . a:url
endfunction
]])

vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
