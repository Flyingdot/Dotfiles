return {
	"knubie/vim-kitty-navigator",
	config = function()
		vim.fn.system("cp ./*.py ~/.config/kitty/")

		vim.keymap.set("n", "<M-h>", ":KittyNavigateLeft<CR>", { desc = "Navigate left" })
		vim.keymap.set("n", "<M-l>", ":KittyNavigateRight<CR>", { desc = "Navigate right" })
		vim.keymap.set("n", "<M-j>", ":KittyNavigateDown<CR>", { desc = "Navigate down" })
		vim.keymap.set("n", "<M-k>", ":KittyNavigateUp<CR>", { desc = "Navigate up" })
	end,
}
