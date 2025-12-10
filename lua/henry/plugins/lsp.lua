-- new neovim version broke my old config
-- everthing is scattered, pyright and clangd are working fine, lua_ls is not working(tried a lot)
-- i still don't know how lsp works, i used chatgpt to solve every issue

return {
    ---------------------------------------------------------------------------
    -- Mason package manager
    ---------------------------------------------------------------------------
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({ PATH = "append" })
        end,
    },

    ---------------------------------------------------------------------------
    -- Mason LSP integration (install servers only; no setup handlers)
    ---------------------------------------------------------------------------
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = { "pyright", "clangd", "lua_ls" },
            })
        end,
    },

    ---------------------------------------------------------------------------
    -- Better Lua/Neovim typings (trimmed so lua_ls starts faster)
    ---------------------------------------------------------------------------
    {
        "folke/neodev.nvim",
        opts = {
            -- Provide Neovim runtime/types, but don't auto-add every plugin path
            library = { enabled = true, runtime = true, types = true, plugins = false },
            pathStrict = true,
        },
    },

    ---------------------------------------------------------------------------
    -- Core LSP setup (Neovim 0.11+ API)
    ---------------------------------------------------------------------------
    {
        "neovim/nvim-lspconfig", -- kept for extra schemas/snippets; not used for setup()
        dependencies = { "hrsh7th/cmp-nvim-lsp", "folke/neodev.nvim" },
        config = function()
            -- Initialize neodev (if present) before lua_ls
            pcall(require, "neodev")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            ---------------------------------------------------------------------
            -- Diagnostics (inline, no auto float)
            ---------------------------------------------------------------------
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN]  = " ",
                        [vim.diagnostic.severity.HINT]  = " ",
                        [vim.diagnostic.severity.INFO]  = " ",
                    },
                },
                virtual_text = { prefix = "●", spacing = 2, source = "if_many" },
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "single",
                    focusable = false,
                    source = "always",
                    header = "",
                    scope = "line",
                },
            })

            -- Float styling
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#a89984" })

            ---------------------------------------------------------------------
            -- LSP attach: bordered hover + on-demand diagnostic float
            ---------------------------------------------------------------------
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local enc = (client and client.offset_encoding) or "utf-16"

                    -- Bordered hover (manual)
                    local function bordered_hover()
                        local params = vim.lsp.util.make_position_params(0, enc)
                        vim.lsp.buf_request(0, "textDocument/hover", params, function(err, result)
                            if err or not result or not result.contents then return end
                            local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
                            local cleaned = {}
                            for _, line in ipairs(lines) do
                                if line:match("%S") then table.insert(cleaned, line) end
                            end
                            if vim.tbl_isempty(cleaned) then return end
                            local _, win = vim.lsp.util.open_floating_preview(cleaned, "markdown", { border = "single" })
                            vim.api.nvim_create_autocmd({ "CursorMoved", "BufHidden", "InsertEnter", "FocusLost" }, {
                                once = true,
                                callback = function()
                                    if win and vim.api.nvim_win_is_valid(win) then pcall(vim.api.nvim_win_close, win, true) end
                                end,
                            })
                        end)
                    end

                    local opts = { buffer = bufnr, remap = false, nowait = true }
                    local keymap = vim.keymap.set

                    keymap("n", "K", bordered_hover, opts)
                    keymap("n", "<C-k>", function()
                        vim.diagnostic.open_float(nil, {
                            border = "single",
                            focusable = false,
                            source = "always",
                            header = "",
                            scope = "line",
                            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                        })
                    end, opts)

                    keymap("n", "gd", vim.lsp.buf.definition, opts)
                    keymap("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
                    keymap("n", "<leader>df", vim.diagnostic.open_float, opts)
                    keymap("n", "gi", vim.lsp.buf.implementation, opts)
                    keymap("n", "[d", vim.diagnostic.goto_next, opts)
                    keymap("n", "]d", vim.diagnostic.goto_prev, opts)
                    keymap("n", "<leader>h", vim.lsp.buf.signature_help, opts)
                    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    keymap("n", "<leader>rr", vim.lsp.buf.references, opts)
                    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    keymap("i", "<C-h>", vim.lsp.buf.signature_help, opts)
                end,
            })

            ---------------------------------------------------------------------
            -- Servers (new API)
            ---------------------------------------------------------------------
            local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

            local servers = {
                clangd = {
                    capabilities = capabilities,
                    cmd = { "clangd" }, -- rely on PATH
                },
                pyright = {
                    capabilities = capabilities,
                    cmd = { "pyright-langserver", "--stdio" },
                },
                lua_ls = {
                    capabilities = capabilities,
                    -- Pin to Mason's shim to avoid PATH clashes
                    cmd = { mason_bin .. "lua-language-server" },
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },

                            -- ⚡ Faster startup: keep library empty; neodev injects needed types.
                            workspace = {
                                checkThirdParty = false,
                                library = {},          -- don't enumerate tons of paths
                                maxPreload = 300,      -- lower = less upfront indexing
                                preloadFileSize = 200, -- KB; skip huge files during preload
                            },

                            completion = {
                                workspaceWord = false, -- small perf win
                                callSnippet = "Replace",
                            },

                            hint = { enable = true },
                            telemetry = { enable = false },
                        },
                    },
                },
            }

            -- Register + enable
            local enable_list = {}
            for name, opts in pairs(servers) do
                vim.lsp.config(name, opts)
                table.insert(enable_list, name)
            end
            vim.lsp.enable(enable_list)
        end,
    },

    ---------------------------------------------------------------------------
    -- none-ls (successor of null-ls)
    ---------------------------------------------------------------------------
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
                },
            })
        end,
    },
}
