vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Go to file explorer" })

vim.keymap.set("i", "jk", "<esc>", { desc = "jk to escape" })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<M-k>", ":wincmd k<CR>", { desc = "Move to upper split" })
vim.keymap.set("n", "<M-j>", ":wincmd j<CR>", { desc = "Move to below split" })
vim.keymap.set("n", "<M-l>", ":wincmd l<CR>", { desc = "Move to right split" })
vim.keymap.set("n", "<M-h>", ":wincmd h<CR>", { desc = "Move to left split" })

vim.keymap.set("x", "p", "P")
vim.keymap.set("x", "P", "p")

-- keep cursor in the middle of the screen
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
