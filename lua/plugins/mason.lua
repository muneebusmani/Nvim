return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  -- lazy = true,
  opts = {
    ensure_installed = {
      "blade-formatter",
      -- "docker-compose-language-service",
      "dockerfile-language-server",
      "emmet-ls",
      "eslint_d",
      "hadolint",
      "html-lsp",
      -- "intelephense",
      "pretty-php",
      -- "phpstan",
      "stylua",
      "luacheck",
      "lua-language-server",
      -- "pint",
      -- "tlint",
      "markdownlint",
      -- "sonarlint-language-server",
      -- "psalm",
      "sqlls",
      "sqlfmt",
      "sqlfluff",
      "prettierd",
    },
  },
}
