-- -- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
      -- icons_enabled = "false",
      section_separators = "",
      component_separators = { left = "和", right = "|" },
      -- component_separators = { left = "|", right = "|" },
      -- theme = "seoul256", -- for kanagawa theme
      -- theme = "rose-pine"
      -- theme = "catpuccin"
      -- theme = "gruvbox-material", -- for gruvbox
      -- theme = "github_dark_dimmed", -- for gruvbox
      -- theme = "gruvbox", -- for gruvbox
      -- theme = "everforest" -- for gruvbox
      -- theme = "tokionight"
  },
})

