-- use vim.cmd.CommandName instead of :CommandName<Cr>

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap

-- greatest remap ever,
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland

vim.keymap.set({"n", "v"}, "Y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delte but do not copy to buffer

vim.api.nvim_set_keymap("n", "<C-p>", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "<C-p>", '"+p', { noremap = true })

-- move line above and below
map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

--general keymap

map.set("n", "<leader>nh", "<cmd>nohl<CR>")
map.set("n", "x", '"_x')           --cut but don't copy to register

map.set("n", "<leader>+", "<C-a>") --cut but don't copy to register
map.set("n", "<leader>-", "<C-x>") --cut but don't copy to register

-- YankHilight
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({timeout=100})
  end,
})

--split window
map.set("n", "<leader>sv", "<C-w>v")         -- split window vertically
map.set("n", "<leader>sh", "<C-w>s")         -- split window horizontally
map.set("n", "<leader>se", "<C-w>=")         -- split window vertically
map.set("n", "<leader>sx", "<cmd>close<CR>") -- split window vertically

--vertical movement (theprimeagen)
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")


--source file
-- map.set("n", "<leader>S", "<cmd>so%<CR>") not supported in lazy

-- quit
map.set("n", "<leader>q", ":q<CR>")
map.set("n", "<leader>Q", ":q!<CR>")

--manage tabs
map.set("n", "<leader>to", "<cmd>tabnew<CR>")   --open new tab
map.set("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
map.set("n", "<leader>tn", "<cmd>tabn<CR>")     --close current tab
map.set("n", "<leader>tp", "<cmd>tabp<CR>")     --close current tab

-- plugin keymaps
map.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>")

--nvim-tree
map.set("n", "<leader>cs", vim.cmd.TSHighlightCapturesUnderCursor) -- split window vertically

-- undo tree
map.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--telescope
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- Format Document
vim.keymap.set("n", "<leader>m", function()
    vim.lsp.buf.format()
end)

-- find replace
vim.keymap.set("n", "<C-r>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- run r.sh
-- vim.api.nvim_set_keymap('n', '<leader>r', [[:! bash r.sh <CR>]], { noremap = true, silent = true })

-- Experiment
