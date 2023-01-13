require("henry.plugins-setup")
require("henry.core.options")
require("henry.core.keymaps")
require("henry.core.harpoon")
require("henry.plugins.comment")
require("henry.plugins.nvim-tree")
require("henry.plugins.lualine")
require("henry.plugins.telescope")
require("henry.plugins.treesitter")
require("henry.plugins.fugutive")
require("henry.plugins.autopairs")
require("henry.plugins.gitsigns")
require("henry.plugins.lsp")
require("henry.plugins.cmp")
require("henry.core.colorscheme")

-- require("henry.plugins.lsp.mason")
-- require("henry.plugins.lsp.lspsaga")
-- require("henry.plugins.lsp.lspconfig")
-- require("henry.plugins.lsp.null-ls")

-- Enable transparent background
vim.cmd("hi Normal guibg=NONE ctermbg=NONE") -- apparently this 1 line is enough
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")

--vim.g.neovide_background_color = "#111111"
-- vim.g.neovide_background_color = "blue"
-- vim.g.neovide_transparency = 0.0
--vim.g.transparency = 0.8
-- vim.g.neovide_transparency = 0.8
-- if not pcall(require, "colorbuddy") then
--   return
-- end
--
--
-- -- if vim.env.USER == "tj-wsl" then
-- --   rawset(require("colorbuddy").styles, "italic", require("colorbuddy").styles.none)
-- -- end
-- require("colorbuddy").colorscheme "gruvbuddy"
-- require("colorbuddy").setup()

--cmp temp
-- local cmp = require('cmp')
-- local luasnip = require('luasnip')
--
--
-- cmp.setup({
--     snippet = {
--         expand = function(args)
--         luasnip.lsp_expand(args.body)
--     end
--     },
--     sources = {
--         {name = 'path'},
--         {name = 'nvim_lsp'},
--         {name = 'buffer', keyword_length = 3},
--         {name = 'luasnip', keyword_length = 2}
--     },
--     window = {
--         documentation = cmp.config.window.bordered()
--     },
--     formatting = {
--         fields = {'menu', 'abbr', 'kind'},
--         format = function(entry, item)
--         local menu_icon = {
--                 nvim_lsp = 'lsp',
--                 luasnip = 'snip',
--                 buffer = 'buffer',
--                 path = 'path'
--         }
--        item.menu = menu_icon[entry.source.name]
--             return item
--         end
--     },
--     mapping ={
--       ["<C-k>"] = cmp.mapping.select_prev_item(),
--           ["<C-j>"] = cmp.mapping.select_next_item(),
--       ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
--       ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
--       ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--       ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--       ["<C-e>"] = cmp.mapping {
--         i = cmp.mapping.abort(),
--         c = cmp.mapping.close(),
--       },
--       -- Accept currently selected item. If none selected, `select` first item.
--       -- Set `select` to `false` to only confirm explicitly selected items.
--       ["<CR>"] = cmp.mapping.confirm { select = true },
--       ["<Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_next_item()
--         elseif luasnip.expandable() then
--           luasnip.expand()
--         elseif luasnip.expand_or_jumpable() then
--           luasnip.expand_or_jump()
--         -- elseif check_backspace() then
--         --   fallback()
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--       ["<S-Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_prev_item()
--         elseif luasnip.jumpable(-1) then
--           luasnip.jump(-1)
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       }),
--     },
-- })


