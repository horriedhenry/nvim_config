local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("henry.plugins.lsp.handlers").on_attach,
		capabilities = require("henry.plugins.lsp.handlers").capabilities,
	}
	if server.name == "sumneko_lua" then
		local sumneko_opts = require("henry.plugins.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_lua, sumneko_opts)
	end
	server:setup(opts)
end)
