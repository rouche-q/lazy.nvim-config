return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup()
    vim.keymap.set("n", "<leader>tx", function() require("trouble").toggle() end, { desc = "Trouble all files" })
    vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end,
      { desc = "Trouble workspace" })
    vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end,
      { desc = "Trouble Document" })
    vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix" })
  end
}
