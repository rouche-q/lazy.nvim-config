return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      { "<leader>f", group = "Find with Telescope" },
      { "<leader>q", group = "Quit/session" },
      { "<leader>s", group = "Search with Telescope" },
      { "<leader>t", group = "Trouble" },
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
