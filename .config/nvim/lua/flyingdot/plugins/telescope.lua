return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Fuzzy find files in git repo" })
		vim.keymap.set("n", "<leader>fs", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Grep string in cwd" })
		vim.keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Grep string under cursor in cwd" }
		)
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
