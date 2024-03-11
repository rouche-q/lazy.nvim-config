local autocmds = {}

local function augroup(name)
  return vim.api.nvim_create_augroup("autocmds_" .. name, { clear = true })
end

function autocmds.init()
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
      vim.highlight.on_yank()
    end,
  })
end

return autocmds
