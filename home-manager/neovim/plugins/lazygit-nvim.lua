do
  vim.keymap.set("n", "<leader>lg", function()
    require("lazygit").lazygit(vim.fn.getcwd())
  end, { desc = "[S]earch [H]elp" })
end
