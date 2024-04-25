return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    delay = 100
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end
}
