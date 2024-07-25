return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "hrsh7th/cmp-cmdline",
        lazy = true,
        -- event = "CmdlineEnter",
        config = function()
          local cmp = require("cmp")
          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = "path" },
            }, {
              {
                name = "cmdline",
                option = {
                  ignore_cmds = { "Man", "!" },
                },
              },
            }),
          })
        end,
      },
      {
        "hrsh7th/cmp-buffer",
        lazy = true,
        -- event = "CmdlineEnter",
        config = function()
          local cmp = require("cmp")
          cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = "buffer" },
            },
          })
        end,
      },
    },

    opts = {
      ---@type lspconfig.config
      servers = {
        -- dartls = {},
        cssls = {
          filetypes = { "css", "scss", "less", "sass" },
        },
      },
    },
  },
}
