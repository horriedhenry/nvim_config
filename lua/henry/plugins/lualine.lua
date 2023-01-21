-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
      icons_enabled = "false",
      section_separators = "",
      component_separators = "|",
      -- theme = "seoul256", -- for kanagawa theme
      -- theme = "rose-pine"
      theme = "gruvbox"
  },
})

