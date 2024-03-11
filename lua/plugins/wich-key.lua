return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["<leader>q"] = { name = "Quit/session" },
      ["<leader>f"] = { name = "Find with Telescope" },
      ["<leader>s"] = { name = "Search with Telescope" },
      ["<leader>t"] = { name = "Trouble" },
    },
  },
  config = function(_, opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
