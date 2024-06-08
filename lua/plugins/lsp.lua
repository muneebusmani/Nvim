return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type lspconfig.options
      servers = {
        phpactor = {
          filetypes = { "php", "blade" },
            settings = {
              phpactor = {
                filetypes = { "php", "blade" },
                files = {
                  associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                  maxSize = 5000000,
                },
              },
            },
          },
            sqlls = {
              cmd = { "sql-language-server", "up", "--method", "stdio" },
              filetypes = { "sql", "mysql", "mongo", "mssql", "postgresql", "sqlite" },
              root_dir = function(pattern)
                local util = require("lspconfig").util
                local cwd = vim.loop.cwd() or vim.env.HOME
                -- local root = util.root_pattern(".sqllsrc.json")(pattern)
                -- return util.path.is_descendant(cwd, root) and cwd or root
                return cwd
              end,
            },
            -- intelephense = {
            --   filetypes = { "php", "blade" },
            --   files = {
            --     associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
            --     maxSize = 5000000,
            --   },
            -- },
            cssls = {
              filetypes = { "css", "scss", "less", "sass" },
            },
          },
        },
      },
    }
