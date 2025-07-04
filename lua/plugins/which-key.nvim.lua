local wk = require("which-key")

wk.add({
  { mode = { "n", "v" } },
  { ";", group = "+diy-keymaps" },
})

wk.add({
  { mode = { "n", "v" } },
  { ";j", group = "jumpking" },
})

wk.add({
  { mode = { "n", "v" } },
  { ";f", group = "+grug-far" },
})

wk.add({
  { mode = { "n", "v" } },
  { ";y", group = "+yazi" },
})

return {
  "folke/which-key.nvim",
  opts = {
    win = {
      border = "rounded", -- none, single, double, shadow, rounded
    },
    -- icons = {
    --   rules = false,
    -- },
  },
}
