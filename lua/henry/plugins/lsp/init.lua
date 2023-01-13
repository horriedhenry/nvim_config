local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("henry.plugins.lsp.lsp-installer")
require("henry.plugins.lsp.mason")
require("henry.plugins.lsp.handlers").setup()
require("henry.plugins.lsp.null-ls")

