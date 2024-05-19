local mason_registry = require("mason-registry")
vim.g.OmniSharp_server_path = mason_registry.get_package("omnisharp"):get_install_path() .. "/omnisharp"
vim.g.omnisharp_auto_start = true
vim.g.omnisharp_use_lsp = true

return {
    "OmniSharp/omnisharp-vim"
}