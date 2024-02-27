return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
      },
    },
    ft = 'mason',
    keys = function()
      local builtin = require("telescope.builtin")
      local utils = require("telescope.utils")
      return {
        --- Search
        { "<leader>sg", builtin.live_grep,                                  desc = "Live search" },
        {
          "<leader>sw",
          function()
            builtin.grep_string({ word_match = "-w" })
          end,
          desc = "Grep a Word"
        },
        {
          "<leader>sw",
          function()
            builtin.grep_string({ word_match = "-w" })
          end,
          mode = "v",
          desc = "Grep a Word"
        },
        --- Find
        { "<leader>ff", builtin.find_files,                                 desc = "Find Files" },
        { "<leader>fr", builtin.lsp_references,                             desc = "Find References" },
        { "<leader>fi", require("telescope.builtin").lsp_implementations(), desc = "Find Implementations" },
      }
    end,
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        },
      })
      require('telescope').load_extension('fzf')
      require("telescope").load_extension("ui-select")
    end,
  },
}
