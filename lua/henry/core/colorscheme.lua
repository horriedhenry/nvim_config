--local status, _ = pcall(vim.cmd, "colorscheme dracula")

-- Enable transparent background
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
-- vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
-- vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")

-- vim.g.gruvbox_contrast_dark="soft"
-- vim.g.gruvbox_italicize_comments=0

-- vim.g.syntax=enable
-- let g:oceanic_next_terminal_bold = 1
-- let g:oceanic_next_terminal_italic = 1
-- colorscheme OceanicNext

-- if not status then
--     print("colorscheme not found!!")
--     return
-- end


local status, _ = pcall(vim.cmd, "colorscheme gruvbox")

if not status then
    print("colorscheme not found!!")
    return
end
-- Default options:
require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {},
    theme = "default"           -- Load "default" theme or the experimental "light" theme
})

-- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")


local colors = require('dracula').colors()

-- local catppuccin = require("catppuccin")

-- catppuccin.setup({
--   transparent_bg = true, -- default false
-- }
-- )


-- dracule
local dracula = require("dracula")
dracula.setup({
  -- customize dracula color palette
  colors = {
    bg = "#282a36",
    fg = "#f8f8f2",
    selection = "#44475a",
    comment = "#6272a4",
    red = "#ff5555",
    orange = "#ffb86c",
    yellow = "#f1fa8c",
    green = "#68b984",
    purple = "#bd93f9",
    cyan = "#8be9fd",
    pink = "#ff79c6",
    bright_red = "#ff6e6e",
    bright_green = "#69ff94",
    bright_yellow = "#ffffa5",
    bright_blue = "#d6acff",
    bright_magenta = "#ff92df",
    bright_cyan = "#a4ffff",
    bright_white = "#ffffff",
    menu = "#21222c",
    visual = "#3e4452",
    gutter_fg = "#4b5263",
    nontext = "#3b4048",
  },
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = false, -- default false
  -- set custom lualine background color
  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
  italic_comment = false, -- default false
  -- overrides the default highlights see `:h synidattr`
  overrides = {
    -- examples
    -- nontext = { fg = dracula.colors().white }, -- set nontext fg to white
    -- nvimtreeindentmarker = { link = "nontext" }, -- link to nontext highlight
    -- nothing = {} -- clear highlight of nothing
  },
})
