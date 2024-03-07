local keymaps = {}

function keymaps.init()
  vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
  vim.keymap.set("n", "<leader>qq", "<cmd>wqa<cr>", { desc = "Quit all" })

  vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
  vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

  vim.keymap.set("n", "rg", "<cmd> lua vim.lsp.buf.references()<cr>")
  vim.keymap.set("n", "ri", "<cmd> lua vim.lsp.buf.implementations()<cr>")
end

return keymaps
