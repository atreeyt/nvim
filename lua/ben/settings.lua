vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false --  highlight search results
vim.opt.incsearch = true -- i think multiple search results?
vim.opt.scrolloff = 8
--Adds a counter for the number of search matches in the bottom right.
vim.opt.shortmess:remove("S")
vim.opt.background=dark
vim.o.foldcolumn = "1"
vim.g.lazyvim_check_order = false
