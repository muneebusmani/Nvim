return {
  "adalessa/laravel.nvim",
  event = { "VeryLazy" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvimtools/none-ls.nvim",
  },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  keys = {
    { "<leader>la", ":Laravel artisan<CR>", silent = true, desc = "Laravel Artisan" },
    -- { "<leader>lr", ":Laravel routes<cr>" , desc = "Laravel " },
    -- { "<leader>lm", ":Laravel related<cr>" },
  },
  -- lazy = true,
  config = function(opts)
    require("laravel").setup(opts)
  end,
}
