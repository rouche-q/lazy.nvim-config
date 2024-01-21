return {
  'stevearc/conform.nvim',
  config = function()
   require("conform").setup({
     formater_by_ft = {
      lua = {"stylua"}
    }
   })
  end
}
