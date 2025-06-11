do
  vim.keymap.set("n", "<leader>lg", function()
    require("lazygit").lazygit(vim.fn.getcwd())
  end, { desc = "[L]azy [G]it" })

  vim.api.nvim_create_autocmd({ "BufLeave" }, {
    pattern = { "*LazyGit*" },
    group = vim.api.nvim_create_augroup("git_refresh_neotree", { clear = true }),
    callback = function()
      require("neo-tree.sources.filesystem.commands").refresh(
        require("neo-tree.sources.manager").get_state("filesystem")
      )
    end,
  })
end
