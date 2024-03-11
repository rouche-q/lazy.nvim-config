local keymaps = {}

function keymaps.init()
  vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
  vim.keymap.set("n", "<leader>qq", "<cmd>wqa<cr>", { desc = "Quit all" })

  vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
  vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
  vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to up window" })
  vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to down window" })

  vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
end

return keymaps
