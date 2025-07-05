return {
  "ravitemer/mcphub.nvim",
  build = "bundled_build.lua", -- Bundles `mcp-hub` binary along with the neovim plugin
  opts = {
    use_bundled_binary = true,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
