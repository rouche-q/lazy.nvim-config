return {
  'saghen/blink.cmp',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      dependencies = {
        'rafamadriz/friendly-snippets',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip.loaders.from_vscode').lazy_load({ paths = { vim.fn.stdpath 'config' .. '/snippets' } })
          end
      }
    },
  },
  opts = {
    keymap = { preset = 'enter' },
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false
        }
      },
      menu = {
        draw = {
          columns = {{"label", "label_description"}, {"kind_icon", gap = 1, "kind"}}
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0
      }
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      prebuilt_binaries = {
        download = true,
        force_version = 'v0.13.0',
      }
    }
  }
}
