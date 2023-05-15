-- -- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
      icons_enabled = "true",
      section_separators = " ",
      component_separators = { left = "和", right = "|" },
      -- component_separators = { left = "|", right = "|" },
      -- theme = "seoul256", -- for kanagawa theme
      -- theme = "rose-pine"
      -- theme = "catppuccin"
      theme = "gruvbox-material", -- for gruvbox
      -- theme = "everforest" -- for gruvbox
  },
})
--

-- New  config
-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'gruvbox-material',
--     -- component_separators = { left = '|', right = '|'},
--     -- section_separators = { left = '', right = ''},
--       section_separators = " ",
--       component_separators = { left = "和", right = "|" },
--
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     globalstatus = true,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--     }
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {}
-- }
