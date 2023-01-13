local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local map = vim.keymap

map.set("n", "<leader>a", mark.add_file)
map.set("n", "<leader>h",ui.toggle_quick_menu)
-- map.set("n", "<leader>1",ui.nav_next)
-- map.set("n", "<leade>2",ui.nav_prev)


map.set("n", "<leader>1", function() ui.nav_file(1) end)
map.set("n", "<leader>2", function() ui.nav_file(2) end)
map.set("n", "<leader>3", function() ui.nav_file(3) end)
map.set("n", "<leader>4", function() ui.nav_file(4) end)
map.set("n", "<leader>5", function() ui.nav_file(5) end)
