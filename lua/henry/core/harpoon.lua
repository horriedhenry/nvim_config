local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local map = vim.keymap

map.set("n", "<leader>a", mark.add_file)
map.set("n", "<C-e>", ui.toggle_quick_menu)

map.set("n", "<C-f>", function() ui.nav_file(1) end)
map.set("n", "<C-s>", function() ui.nav_file(2) end)
map.set("n", "<C-t>", function() ui.nav_file(3) end)
map.set("n", "<C-n>", function() ui.nav_file(4) end)
