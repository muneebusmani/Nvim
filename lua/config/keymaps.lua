-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set=vim.keymap.set
-- Copy Line Down : Ctrl+D
set('n',"<C-d>","VYp")
set('i',"<C-d>","<C-c>VYpi")

-- Delete Line : Ctrl+F
set('n',"<C-f>","dd")
set('i',"<C-f>","<C-c>ddi")