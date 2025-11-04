return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        dependencies = {
            { "echasnovski/mini.icons", opts = {} },
        },
        lazy = false,
        config = function()
            require("oil").setup {
                -- columns = { "icons" },
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = false,
                    ["<C-h>"] = false,
                    ["<C-t>"] = false,
                    ["<C-p>"] = false,
                    ["<C-c>"] = "actions.close",
                    ["<C-l>"] = false,
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["~"] = "actions.tcd",
                    ["gs"] = false,
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                    ["g\\"] = "actions.toggle_trash",
                },
                view_options = {
                    -- Show files and directories that start with "."
                    show_hidden = true,
                },
                vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
            }
        end,
    }
}
