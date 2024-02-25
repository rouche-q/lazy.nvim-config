return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = function()
    local trouble_do = function(opts)
      return function()
        return require("trouble").toggle(opts)
      end
    end

    return {
      { "<leader>tx", trouble_do(),                        desc = "Trouble all files" },
      { "<leader>tw", trouble_do("workspace_diagnostics"), desc = "Trouble workspace" },
      { "<leader>td", trouble_do("document_diagnostics"),  desc = "Trouble document" },
    }
  end,
  config = function()
    require("trouble").setup()
  end
}
