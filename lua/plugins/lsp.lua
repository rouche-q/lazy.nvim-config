return {
  "williamboman/mason.nvim",
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "VonHeikemen/lsp-zero.nvim"
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
    local lspconfig = require("lspconfig")
    local lsp_zero = require("lsp-zero")
    local capabilities = require("blink.cmp").get_lsp_capabilities()


    lsp_zero.on_attach(
      function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end
    )

    mason_lspconfig.setup({
      automatic_installation = true,
      ensure_installed = {
        "lua_ls"
      },

      handlers = {
        function(server)
          lspconfig[server].setup({ capabilities = capabilities })
        end
      }
    })
  end
}
