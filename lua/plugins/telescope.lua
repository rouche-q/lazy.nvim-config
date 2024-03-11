return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
    },
  },
  ft = 'mason',
  keys = function()
    local builtin = require("telescope.builtin")
    return {
      --- Search
      { "<leader>sg", builtin.live_grep,           desc = "Live search" },
      {
        "<leader>sw",
        function()
          builtin.grep_string({ word_match = "-w" })
        end,
        desc = "Grep a Word"
      },
      --- Find
      { "<leader>fd", builtin.lsp_definitions,     desc = "Find Definitions" },
      { "<leader>ff", builtin.find_files,          desc = "Find Files" },
      { "<leader>fr", builtin.lsp_references,      desc = "Find References" },
      { "<leader>fi", builtin.lsp_implementations, desc = "Find Implementations" },
      --- Other
      {
        "<leader>N",
        function()
          require('telescope').extensions.notify.notify()
        end,
        desc = "Last notifications"
      }
    }
  end,
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      },
    })
    require('telescope').load_extension('fzf')
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("notify")
  end,
}
