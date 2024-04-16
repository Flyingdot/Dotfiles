vim.cmd("let g:netrw_liststyle = 3")

-- linenumbers
vim.opt.number = true
vim.opt.relativenumber = true

-- general
vim.opt.termguicolors = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus" -- use system clipboard
vim.opt.cursorline = true -- highlight current line
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.colorcolumn = "120"
vim.opt.signcolumn = "yes"
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- window management
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

