local prettier = function()
  return {
    exe = "prettierd",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
      prettier
    },
    javascriptreact = {
      prettier
    },
    typescript = {
      prettier
    },
    typescriptreact = {
      prettier
    },
    vue = {
      prettier
    },
  }
})

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Format<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>FormatWrite<CR>", { noremap = true, silent = true })

-- format on save
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
