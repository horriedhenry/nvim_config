-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end

-- configure telescope
telescope.setup({
    -- configure custom mappings
    defaults = {
        file_ignore_patterns = {
            "git"
        },
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,                       -- move to prev result
                ["<C-j>"] = actions.move_selection_next,                           -- move to next result
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
            },
        }
    },
})

telescope.load_extension("fzf")

local map = vim.keymap

map.set("n", "<leader>f", "<cmd>Telescope find_files<cr>")
-- map.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
-- map.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
-- map.set("n", "<leader>c", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
map.set("n", "<leader>b", "<cmd>Telescope buffers<cr>")               -- list open buffers in current neovim instance
map.set("n", "<leader>H", "<cmd>Telescope help_tags<cr>")             -- list available help tags
map.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")          -- list available help tags
map.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>") -- list available help tags

local builtin = require('telescope.builtin')
map.set("n", '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
map.set('n', '<leader>vh', builtin.help_tags, {})
