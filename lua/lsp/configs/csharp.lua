return {
    "omnisharp/omnisharp-roslyn",
    ft = { "cs" },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_registry = require("mason-registry")
        local pid = vim.fn.getpid()
        local omnisharp_path = mason_registry.get_package("omnisharp"):get_install_path()
        
        lspconfig.omnisharp.setup({
            -- 服务器路径，根据实际情况修改
            cmd = { omnisharp_path .. "/omnisharp", "--languageserver", "--hostPID", tostring(pid) },
            capabilities = require("lsp.handlers").capabilities,
            on_attach = require("lsp.handlers").on_attach,
        })
        
        vim.g.OmniSharp_server_path = mason_registry.get_package("omnisharp"):get_install_path() .. "/omnisharp"
        vim.g.omnisharp_auto_start = true
        vim.g.omnisharp_use_lsp = true
    end,
}