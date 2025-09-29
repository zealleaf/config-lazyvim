return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        yaml = { "prettierd" },
        toml = { "taplo" },
        svg = { "lemminx" },
        bash = { "shfmt" },
        lua = { "stylua" },
        html = { "prettierd" },
        css = { "prettierd" },
        less = { "prettierd" },
        javascript = { "prettierd", "eslint_d" },
        typescript = { "prettierd", "eslint_d" },
        javascriptreact = { "prettierd", "eslint_d" },
        typescriptreact = { "prettierd", "eslint_d" },
        vue = { "prettierd", "eslint_d" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        markdown = {
          "prettierd",
          "markdownlint",
        },
        c = { "clang_format" },
        rust = { "rustfmt" },
        python = {
          formatters = { "isort", "black" },
          run_all_formatters = true,
        },
        go = {
          formatters = { "gofumpt", "goimports" },
          run_all_formatters = true,
        },
      },
    },
  },
  {
    "goolord/alpha-nvim",
    config = function()
      local config = require("alpha.themes.startify").config
      local button = require("alpha.themes.startify").button
      config.layout[2].val = {
        [[               _ _             __ ]],
        [[ _______  __ _| | | ___  __ _ / _|]],
        [[|_  / _ \/ _` | | |/ _ \/ _` | |_ ]],
        [[ / /  __/ (_| | | |  __/ (_| |  _|]],
        [[/___\___|\__,_|_|_|\___|\__,_|_|  ]],
      }
      config.layout[4] = {
        type = "group",
        val = {
          button("q", "Quit", "<cmd> qa <cr>"),
        },
      }
      config.layout[8] = {
        type = "group",
        val = {
          ---@diagnostic disable-next-line: param-type-mismatch
          button("c", "Lazy Config", LazyVim.pick.config_files()),
          button("x", "Lazy Extras", "<cmd> LazyExtra <cr>"),
          button("l", "Lazy Store", "<cmd> Lazy <cr>"),
        },
      }
      require("alpha").setup(config)
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>yy",
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
  },
}
