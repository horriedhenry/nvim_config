-- use vim.cmd.CommandName instead of :CommandName<Cr>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap

--general keymap

map.set("n", "<leader>nh", "<cmd>nohl<CR>")
map.set("n", "x", '"_x') --cut but don't copy to register

map.set("n", "<leader>+", "<C-a>") --cut but don't copy to register
map.set("n", "<leader>-", "<C-x>") --cut but don't copy to register

--split window
--map.set("n", "<leader>sv", ":vsplit<CR>") -- split window vertically
--map.set("n", "<leader>sh", ":split<CR>") -- split window vertically
map.set("n", "<leader>sv", "<C-w>v") -- split window vertically
map.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
map.set("n", "<leader>se", "<C-w>=") -- split window vertically
map.set("n", "<leader>sx", "<cmd>close<CR>") -- split window vertically

--vertical movement (theprimeagen)
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")


--souce file
map.set("n", "<leader>S", "<cmd>so%<CR>")

-- quit
map.set("n", "<leader>q", ":q<CR>")
map.set("n", "<leader>Q", ":q!<CR>")

--save
map.set("n", "<leader>w", "<cmd>w<CR>")
map.set("n", "<leader>W", "<cmd>wq<CR>")

--manage tabs
map.set("n", "<leader>to", "<cmd>tabnew<CR>") --open new tab
map.set("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
map.set("n", "<leader>tn", "<cmd>tabn<CR>") --close current tab
map.set("n", "<leader>tp", "<cmd>tabp<CR>") --close current tab

-- plugin keymaps
map.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>")

--nvim-tree
map.set("n", "<leader>e", vim.cmd.NvimTreeToggle) -- split window vertically

-- undo tree
map.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--telescope
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- ThePrimeagen Harpoon
-- map.set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>")
-- map.set("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
-- map.set("n", "<leader>N", ":lua require('harpoon.ui').nav_next()<CR>")
-- map.set("n", "<leader>p", ":lua require('harpoon.ui').nav_prev()<CR>")


-- telescope git commands (not on youtube nvim video)
-- map.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- map.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- map.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- map.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
--keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary



-- Experiment

vim.keymap.set("n", "<leader>m", function()
    vim.lsp.buf.format()
end)
-- Experiment
