return {
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = false,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Reusable on_attach for all servers
            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }


                -- Hover with border (use with transparent background)
                vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                    vim.lsp.handlers.hover,
                    { border = "single" }
                )
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
                vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#a89984" })

                -- Signature help with border and non-blocking
                vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                    vim.lsp.handlers.signature_help,
                    {
                        border = "single",
                        -- close_events = { "CursorMoved", "InsertLeave", "BufHidden" },
                        focusable = false,
                    }
                )

                -- Keymaps
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "<leader>h", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end

            -- Lua LS
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- Clangd
            lspconfig.clangd.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- Add other LSPs here like:
            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
        end,
    },
    -- ✨ Black formatter integration using none-ls
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            require("mason-null-ls").setup({
                ensure_installed = { "black" },
                automatic_installation = true,
            })

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    -- null_ls.builtins.formatting.clang_format.with({
                    --     filetypes = { "c", "cpp", "objc", "objcpp" },
                    --     args = {
                    --         "-style={BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 80, UseTab: Never, AllowShortFunctionsOnASingleLine: Empty}"
                    --     },
                    -- }),
                },
                -- Format on save
                -- on_attach = function(client, bufnr)
                --     if client.supports_method("textDocument/formatting") then
                --         vim.api.nvim_create_autocmd("BufWritePre", {
                --             buffer = bufnr,
                --             callback = function()
                --                 vim.lsp.buf.format({ bufnr = bufnr })
                --             end,
                --         })
                --     end
                -- end,
            })
        end,
    },
}
