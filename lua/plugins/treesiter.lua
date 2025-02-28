return {
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter.configs",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    ensure_installed = {
      "vim",
      "vimdoc",
      "lua",
      "go",
      "javascript",
      "typescript",
      "bash",
    },
    highlight = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  }
}
