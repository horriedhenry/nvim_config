return {
    "nvim-lualine/lualine.nvim",

    config = function()
        local status, lualine = pcall(require, "lualine")
        if not status then
            return
        end

        lualine.setup({
            options = {
                -- icons_enabled = "false",
                section_separators = { left = "", right = "和 " },
                component_separators = { left = "和", right = "|" },
                -- component_separators = { left = "|", right = "|" },
                -- theme = "gruvbox-material", -- for gruvbox
            },
        })
    end,
}
