return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "tokyonight",
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 2            -- 0 = just filename, 1 = relative path, 2 = absolute path
          }
        }
      }
    })
  end,
}
