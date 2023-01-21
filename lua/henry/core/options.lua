vim.opt.guicursor = ""

vim.g.noswapfile=true
local opt = vim.opt


--opt.guicursor=""
opt.number=true
opt.relativenumber=true
opt.softtabstop=4
opt.expandtab=true
opt.autoindent=true

opt.hlsearch=false
opt.incsearch=true

opt.shiftwidth=4 -- 4 previously
opt.tabstop=4 -- 4 previously

opt.smartindent=true
opt.wrap=false

opt.syntax=on


opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamed")

-- split windows 
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")


------

-- for swap files
vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- the primeagen option

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

-- Experimental

