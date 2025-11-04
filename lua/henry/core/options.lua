vim.opt.guicursor = ""

vim.g.noswapfile = true
local opt = vim.opt

--opt.guicursor=""
opt.number = true
opt.relativenumber = true
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.gdefault = true -- for renaming all occurances of a word in selected area.
-- instead of setting all the time (:'<,'>s/word/words/g)

opt.hlsearch = false
opt.incsearch = true

opt.shiftwidth = 4 -- 4 previously
opt.tabstop = 4    -- 4 previously

opt.smartindent = true
opt.wrap = false

opt.syntax = on


opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = 'yes'

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")
-- opt.clipboard = "unnamedplus"

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

-- Games
vim.g.snake_rows = 20
vim.g.snake_cols = 50
vim.g.snake_update = 125

-- Experimental
vim.o.splitbelow = false

-- Transparent mode
-- Make VBGText transparent
vim.api.nvim_set_hl(0, "VBGText", { bg = "none" })

-- Ensure all floating and normal backgrounds are transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
