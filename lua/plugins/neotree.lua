return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      enable_git_status = true,
      window = {
        position = "float",
        mappings = {
          ["<space>"] = "none"
        }
      }
    })

    vim.keymap.set('n', '<space><space>', '<Cmd>Neotree toggle<CR>')
  end,
}
