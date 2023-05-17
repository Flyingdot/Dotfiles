vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J, but keep cursor at its place
vim.keymap.set("n", "J", "mzJ`z") 

-- keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz") 
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv");
vim.keymap.set("n", "N", "Nzzzv");

-- keep buffer on over-paste
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete to void
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace marked word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

