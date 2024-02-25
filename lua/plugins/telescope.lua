return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
      local tlscp_do = function(builtin, opts)
        return function()
          require("telescope.builtin")[builtin](opts)
        end
      end
      local utils = require("telescope.utils")
      return {
        --- Search
        { "<leader>sg", tlscp_do("live_grep"),                               desc = "Grep (root dir)" },
        { "<leader>sG", tlscp_do("live_grep", { cwd = utils.buffer_dir() }), desc = "Grep (cwd)" },
        --- Find
        { "<leader>ff", tlscp_do("find_files"),                              desc = "Find Files" },
        { "<leader>fr", tlscp_do("lsp_references"),                          desc = "Find References" },
        { "<leader>fi", tlscp_do("lsp_implementations"),                     desc = "Find Implementations" },
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
