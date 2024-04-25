require('rose-pine').setup({
    -- disable_italics = false,
    disable_background = false,
    disable_float_background = true,
    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        warn = "gold",

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

        -- git stuff
        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",
    },
    styles = {
        bold = false;
        italic = true;
    },

    -- Change specific vim highlight groups
    -- https://github.com/rose-pine/neovim/wiki/Recipes
    highlight_groups = {
        TODO = { fg = "#FFFF00" }, -- Custom highlight for TODO keyword
        -- TODO : word
    }
})

vim.cmd("colorscheme gruvbox-material")
