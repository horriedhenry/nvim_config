-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

--get lualine nightfly theme
-- local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme
-- local new_colors = {
--   blue = "#65D1FF",
--   green = "#3EFFDC",
--   violet = "#FF61EF",
--   yellow = "#FFDA7B",
--   black = "#000000",
-- }


-- change nightlfy theme colors
-- lualine_nightfly.normal.a.bg = new_colors.blue
-- lualine_nightfly.insert.a.bg = new_colors.green
-- lualine_nightfly.visual.a.bg = new_colors.violet
-- lualine_nightfly.command = {
--   a = {
--     gui = "bold",
--     bg = new_colors.yellow,
--     fg = new_colors.black, -- black
--   },
-- }

-- For dracule theme
-- require('lualine').setup {
--   options = {
--     -- ...
--     theme = 'dracula-nvim'
--     -- ...
--   }
-- }
-- 
-- configure lualine with modified theme (for nightfly theme)
lualine.setup({
  options = {
      icons_enabled = "false",
      section_separators = "",
      component_separators = "|",
      -- theme = lualine_nightfly,
        -- theme = "seoul256", -- for kanagawa theme
        -- theme = "rose-pine"
    theme = "gruvbox"
  },
})

