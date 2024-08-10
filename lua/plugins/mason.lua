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

    local function on_attach(_, buffer)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = buffer })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = buffer })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = buffer })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = buffer })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename", buffer = buffer })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Check references", buffer = buffer })
    end

    for _, server in ipairs(lsp_installed) do
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end

    lspconfig.dockerls.setup {
      settings = {
        docker = {
          languageserver = {
            formatter = {
              ignoreMultilineInstructions = true,
            },
          },
        }
      }
    }

    lspconfig.helm_ls.setup {
      settings = {
        ["helm_ls"] = {
          yamlls = {
            path = "yaml-language-server"
          }
        }
      }
    }
  end
}
