vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_transparent_background = 0
vim.g.gruvbox_material_float_style = "dim"
vim.g.gruvbox_material_menu_selection_background = "orange"
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_cursor = "orange"
-- vim.g.gruvbox_material_sign_column_background = "grey"
vim.g.gruvbox_material_spell_foreground = "colored"
vim.g.gruvbox_material_ui_contrast = "high"
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_lightline_disable_bold = 0

require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")
