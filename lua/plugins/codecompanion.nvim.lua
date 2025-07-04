local prompts = require("zealleaf.utils.prompts")

return {
  "olimorris/codecompanion.nvim",
  keys = {
    { "<C-a>", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    { "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "CodeCompanion Chat Toggle" },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "CodeCompanion Chat Add" },
  },
  init = function()
    vim.cmd([[cab cc CodeCompanion]])
  end,
  opts = {
    opts = {
      language = "Chinese",
    },
    strategies = {
      chat = {
        adapter = "openrouter",
      },
      inline = {
        adapter = "openrouter",
      },
      cmd = {
        adapter = "openrouter",
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
      openrouter = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "https://openrouter.ai/api",
            api_key = "OPENROUTER_API_KEY",
            chat_url = "/v1/chat/completions",
          },
          schema = {
            model = {
              default = "google/gemini-2.5-flash",
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
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          show_result_in_chat = true,
          make_vars = true,
          make_slash_commands = true,
        },
      },
      vectorcode = {
        opts = {
          tool_group = {
            enabled = true,
            extras = {},
            collapse = false,
          },
          tool_opts = {
            ["*"] = {},
            ls = {},
            vectorise = {},
            query = {
              max_num = { chunk = -1, document = -1 },
              default_num = { chunk = 50, document = 10 },
              include_stderr = false,
              use_lsp = false,
              no_duplicate = true,
              chunk_mode = false,
              summarise = {
                enabled = false,
                adapter = nil,
                query_augmented = true,
              },
            },
            files_ls = {},
            files_rm = {},
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
