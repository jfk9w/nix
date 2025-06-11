do
  require("neo-tree").setup({
    filesystem = {
      window = {
        mappings = {
          ["\\"] = "close_window",
          ["h"] = "close_node",
          ["l"] = "open",
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
  })
end
