return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = function()
    return {
      { "<leader>tx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Trouble all files" },
      { "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble document" },
    }
  end,
  config = function()
    require("trouble").setup()
  end
}
