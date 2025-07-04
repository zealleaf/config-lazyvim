vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

local prompts = require("zealleaf.utils.prompts")

return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      opts = {
        language = "Chinese",
      },
      strategies = {
        chat = {
          adapter = "deepseek",
        },
        inline = {
          adapter = "deepseek",
        },
        cmd = {
          adapter = "deepseek",
        },
      },
      adapters = {
        deepseek = function()
          return require("codecompanion.adapters").extend("deepseek", {
            schema = {
              model = {
                default = "deepseek-chat",
              },
            },
          })
        end,
      },
      prompt_library = {
        ["Generate a Commit Message"] = {
          strategy = "chat",
          description = "Generate a commit message",
          opts = {
            index = 99,
            is_default = true,
            is_slash_cmd = true,
            short_name = "commit",
            auto_submit = true,
            placement = "replace",
          },
          prompts = {
            {
              role = "user",
              content = function()
                return string.format(
                  prompts.commit_message,
                  vim.fn.system("git diff --no-ext-diff --staged"),
                  vim.fn.system('git log --pretty=format:"%s" -n 20')
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
