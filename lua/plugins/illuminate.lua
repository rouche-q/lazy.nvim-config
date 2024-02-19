return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {
    delay = 100
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end
}
