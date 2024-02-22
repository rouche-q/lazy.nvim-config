return {
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "lua",
      "go",
      "javascript",
      "typescript",
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
