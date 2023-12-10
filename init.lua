vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins= {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.5',       dependencies = { 'nvim-lua/plenary.nvim' } },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts      = {}
require("lazy").setup(plugins, opts)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set( 'n','<leader>ff', ':Telescope find_files<CR>' )
vim.keymap.set( 'n','<leader>fg', ':Telescope live_grep<CR>' )

local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed =
  { 
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "c_sharp",
    
   },
  highlight = { enable = true },
  indent = { enable = true },  
})

require("catppuccin").setup()

vim.cmd.colorscheme "catppuccin"
