require('rose-pine').setup({
    -- disable_italics = false,
    disable_background = false,
    disable_float_background = true,
    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

        headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
        },
        -- or set all headings at once
        -- headings = 'subtle'
    },

    -- Change specific vim highlight groups
    -- https://github.com/rose-pine/neovim/wiki/Recipes
    highlight_groups = {
        -- ColorColumn = { bg = 'rose' },

        -- Blend colours against the "base" background
        CursorLine = { bg = 'foam', blend = 10 },
        StatusLine = { fg = 'love', bg = 'love', blend = 10 },
    }
})

-- require("catppuccin").setup({
--     flavour = "mocha", -- latte, frappe, macchiato, mocha
--     background = {     -- :h background
--         light = "latte",
--         dark = "mocha",
--     },
--     transparent_background = true, -- disables setting the background color.
--     show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
--     term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
--     dim_inactive = {
--         enabled = false,           -- dims the background color of inactive window
--         shade = "dark",
--         percentage = 0.15,         -- percentage of the shade to apply to the inactive window
--     },
--     no_italic = true,              -- Force no italic
--     no_bold = true,                -- Force no bold
--     no_underline = false,          -- Force no underline
--     styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
--         comments = { "italic" },   -- Change the style of comments
--         conditionals = { "italic" },
--         loops = {},
--         functions = {},
--         keywords = {},
--         strings = {},
--         variables = {},
--         numbers = {},
--         booleans = {},
--         properties = {},
--         types = {},
--         operators = {},
--     },
--     color_overrides = {},
--     custom_highlights = {},
--     integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         treesitter = true,
--         notify = false,
--         mini = false,
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--     },
-- })

require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = false,
    italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {
        -- bright_red = "#f4a261"
        -- FF6E4E // red
        -- E74C3C // red (matches really good)
        bright_red = "#E74C3C",
        -- bright_orange = "#FFA500"
    },
    dim_inactive = false,
    transparent_mode = true,
})

local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")

if not status then
    print("colorscheme not found!!")
    return
end
