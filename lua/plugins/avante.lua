return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    -- enabled = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
      provider = "ollama",
      ollama = {
        model = "deepseek-r1:14b",
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- for windows
    build = vim.fn.has("win32") == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "Kaiser-Yang/blink-cmp-avante",
      --- The below dependencies are optional,
      -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
      -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          sources = {
            -- Add 'avante' to the list
            default = { "avante", "lsp", "path", "luasnip", "buffer" },
            providers = {
              avante = {
                module = "blink-cmp-avante",
                name = "Avante",
                opts = {
                  -- options for blink-cmp-avante
                },
              },
            },
          },
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    -- config = require("avante").setup({
    --   -- other config
    --   -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
    --   system_prompt = function()
    --     local hub = require("mcphub").get_hub_instance()
    --     return hub:get_active_servers_prompt()
    --   end,
    --   -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
    --   custom_tools = function()
    --     return {
    --       require("mcphub.extensions.avante").mcp_tool(),
    --     }
    --   end,
    -- }),
  },
}
