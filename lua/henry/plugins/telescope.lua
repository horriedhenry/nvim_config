return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },

    config = function()
        local telescope_ok, telescope = pcall(require, "telescope")
        if not telescope_ok then return end

        local actions_ok, actions = pcall(require, "telescope.actions")
        if not actions_ok then return end

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "venv",
                    "build",
                },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    },
                },
            },
        })

        -- Load fzf extension safely
        pcall(telescope.load_extension, "fzf")

        -- Keymaps
        local map = vim.keymap.set
        local builtin = require("telescope.builtin")

        map("n", "<leader>f", builtin.find_files, { desc = "Find Files" })
        map("n", "<leader>gf", builtin.git_files, { desc = "Git Files" })
        map("n", "<leader>lg", builtin.live_grep, { desc = "Live Grep" })
        map("n", "<leader>b", builtin.buffers, { desc = "Buffers" })
        map("n", "<leader>H", builtin.help_tags, { desc = "Help Tags" })
        map("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
        map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "LSP Document Symbols" })

        -- Prompted Grep
        map("n", "<leader>sg", function()
            vim.ui.input({ prompt = "Grep > " }, function(value)
                if value then
                    builtin.grep_string({ search = value })
                end
            end)
        end, { desc = "Search with Grep Prompt" })

        map("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Search String Input" })

        map("n", "<leader>vh", builtin.help_tags, { desc = "Help Tags" })
    end,
}
