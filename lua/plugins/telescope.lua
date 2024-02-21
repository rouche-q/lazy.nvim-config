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
      return {
        --- Search
        { "<leader>sg", teledo("live_grep"),                  desc = "Grep (root dir)" },
        { "<leader>sG", teledo("live_grep", { cwd = false }), desc = "Grep (cwd)" },
        --- Find
        { "<leader>ff", teledo("find_files"),                 desc = "Find a file" },
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
