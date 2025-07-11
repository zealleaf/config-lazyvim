return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  opts = {
    provider = "deepseek",
    providers = {
      openrouter = {
        __inherited_from = "openai",
        api_key_name = "OPENROUTER_API_KEY",
        endpoint = "https://openrouter.ai/api/v1",
        model = "google/gemini-2.5-flash",
        disable_tools = true,
      },
      deepseek = {
        __inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com",
        model = "deepseek-coder",
        disable_tools = true,
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make BUILD_FROM_SOURCE=true",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
}
