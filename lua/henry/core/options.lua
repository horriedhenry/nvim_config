vim.opt.guicursor = ""

vim.g.noswapfile=true
local opt = vim.opt


-- Colorscheme
vim.g.gruvbox_bold = 0
vim.g.gruvbox_contrast_dark="medium" -- soft, hard , medium
vim.g.gruvbox_improved_strings=0
vim.g.gruvbox_guisp_fallback="bg"
vim.g.gruvbox_improved_warnings=1

--opt.guicursor=""
opt.number=true
opt.relativenumber=true
opt.softtabstop=4
opt.expandtab=true
opt.autoindent=true
opt.gdefault=true -- for renaming all occurances of a word in selected area.
                  -- instead of setting all the time (:'<,'>s/word/words/g)

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
opt.clipboard:append("unnamedplus")
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

-- Experimental

