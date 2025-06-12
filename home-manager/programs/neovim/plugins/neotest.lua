do
  local neotest = require("neotest")

  neotest.setup({
    adapters = {
      require("neotest-golang")({}),
    },
  })

  local function run_nearest_test()
    neotest.output_panel.clear()
    neotest.output_panel.open()
    neotest.run.run()
  end

  local function run_all_tests()
    neotest.output_panel.clear()
    neotest.output_panel.open()
    neotest.run.run(vim.fn.getcwd())
  end

  vim.keymap.set("n", "<leader>rt", run_nearest_test, { desc = "Run Nearest [T]est" })
  vim.keymap.set("n", "<leader>rT", run_all_tests, { desc = "Run Nearest [T]est" })
end
