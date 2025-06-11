do
  vim.keymap.set("n", "<leader>lg", function()
    require("lazygit").lazygit(vim.fn.getcwd())
  end, { desc = "[L]azy [G]it" })
end
