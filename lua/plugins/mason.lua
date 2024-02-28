return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      }
    })

    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      automatic_installation = true,
      ensure_installed = {
        "lua_ls"
      }
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_installed = mason_lspconfig.get_installed_servers()
    local lspconfig = require("lspconfig")

    for _, server in ipairs(lsp_installed) do
      lspconfig[server].setup({
        capabilities = capabilities
      })
    end
  end
}
