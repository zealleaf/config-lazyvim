return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      ";yb",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      ";yw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      ";ys",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  opts = {
    open_for_directories = false,
    floating_window_scaling_factor = 0.8,
    keymaps = {
      show_help = "~",
    },
  },
}
