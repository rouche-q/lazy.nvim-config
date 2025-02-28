return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      { "<leader>b", group = "Buffers" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>q", group = "Quit/session" },
      { "<leader>s", group = "Search" },
    },
  },
  config = function(_, opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require("which-key")
    wk.setup(opts)
    wk.add(opts.defaults)
  end,
}
