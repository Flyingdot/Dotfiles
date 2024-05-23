return {
	"christoomey/vim-tmux-navigator",
	config = function()
		vim.keymap.set("n", "<M-h>", ":TmuxNavigateLeft<CR>", { desc = "Navigate left" })
		vim.keymap.set("n", "<M-l>", ":TmuxNavigateRight<CR>", { desc = "Navigate right" })
		vim.keymap.set("n", "<M-j>", ":TmuxNavigateDown<CR>", { desc = "Navigate down" })
		vim.keymap.set("n", "<M-k>", ":TmuxNavigateUp<CR>", { desc = "Navigate up" })
	end,
}
