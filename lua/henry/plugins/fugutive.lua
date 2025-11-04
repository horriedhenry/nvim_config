return {
    "tpope/vim-fugitive",

    config = function()
        -- vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

        -- Simplified Fugitive Setup (ChatGpt bullshit)
        vim.keymap.set("n", "<leader>gs", function()
            -- Open Fugitive in the current window
            vim.cmd("Git")

            -- Wait a bit, then switch focus to the Fugitive window if Zen Mode is active
            if vim.g.zen_mode then
                vim.defer_fn(function()
                    -- Look for the Fugitive window explicitly
                    local fugitive_window = nil
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        local buf = vim.api.nvim_win_get_buf(win)
                        if vim.api.nvim_buf_get_option(buf, "filetype") == "fugitive" then
                            fugitive_window = win
                            break
                        end
                    end

                    -- If we found the Fugitive window, set focus on it
                    if fugitive_window then
                        -- Set focus to Fugitive window
                        vim.api.nvim_set_current_win(fugitive_window)
                    else
                        -- Fallback: Log a message if the Fugitive window is not found
                        print("Fugitive window not found!")
                    end
                end, 5) -- Delay of 5ms
            end
        end)

        -- previous setup
        local var_fugutive = vim.api.nvim_create_augroup("HenryFugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = var_fugutive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd [[ Git push ]]
                end, opts)

                -- rebase always
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd [[ Git pull --rebase ]]
                end, opts)

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);

                -- quit using q
                vim.keymap.set("n", "q", function()
                    vim.cmd [[ q ]]
                end, opts)
            end,
        })
    end,
}
