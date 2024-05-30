return {
  -- Configure LazyVim to load gruvbox
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000000,
    lazy = false,
    opts = {
      transparent_background = false,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
