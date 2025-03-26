return {
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 0 } },
      })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
