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
require("henry.plugins.zenmode")
require("henry.plugins.lsp")
require("henry.core.colorscheme")

-- Enable transparent background
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE") -- apparently this 1 line is enough
-- vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
-- vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
-- vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
