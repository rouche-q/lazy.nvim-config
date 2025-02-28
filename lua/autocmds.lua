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

  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
      if vim.bo.filetype == "netrw" then
        vim.cmd("bwipeout")  -- Close netrw buffer
      end
    end,
  })

  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
      local path = vim.fn.expand("%")      
      if vim.fn.isdirectory(path) == 1 then
        require("snacks").picker.explorer({layout = { preset = "default" }, auto_close = true, replace_netrw = true})  -- Open Snack.nvim picker
        vim.cmd("bwipeout")  -- Close the current directory buffer
      end
    end,
  })
end

return autocmds
