return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
      local teledo = function(builtin, opts)
        return function()
          require("telescope.builtin")[builtin](opts)
        end
      end
      local utils = require("telescope.utils")
      return {
        --- Search
        { "<leader>sg", teledo("live_grep"),                               desc = "Grep (root dir)" },
        { "<leader>sG", teledo("live_grep", { cwd = utils.buffer_dir() }), desc = "Grep (cwd)" },
        --- Find
        { "<leader>ff", teledo("find_files"),                              desc = "Find files" },
        { "<leader>fr", teledo("lsp_references"),                          desc = "Find references" },
        { "<leader>fi", teledo("lsp_implementations"),                     desc = "Find Implementations" },
      }
    end,
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
