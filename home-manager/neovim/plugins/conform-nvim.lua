do
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "alejandra" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  })

  vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end, { desc = "[F]ormat buffer" })
end
