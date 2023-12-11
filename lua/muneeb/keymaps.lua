
local g = vim.g
local o = vim.o
local set = vim.keymap.set
local del = vim.keymap.del
local opts={silent=true, noremap=true}
local cmd=vim.cmd
local wo=vim.wo

local n = { "n" }
local i = { "i" }
local v = { "v" }
local ni = { n, i }
local a = { n, i,vb,vl,v }

g.mapleader=" "
o.expandtab=true
o.tabstop=2
o.softtabstop=2
o.shiftwidth=2
wo.number=true
wo.relativenumber=true

set(i,"<A-h>","<left>") -- Alt+h : left
set(i,"<A-l>","<right>") -- Alt+l : right
set(i,"<A-j>","<down>") -- Alt+j : down
set(i,"<A-k>","<up>")  -- Alt+k : up 
set(i,"<C-h>","<C-o>b") -- ctrl+h equivalent to ctrl left
set(i,"<C-l>","<C-o>w") -- alt+l equivalent to clrl right
set(i,"<A-;>","<C-o>:") -- Command Line 

-- Copy Line Down : Ctrl+D
set(n,"<C-d>","VYp")
set(i,"<C-d>","<C-c>VYpi")

-- Delete Line : Ctrl+F
set(n,"<C-f>","dd")
set(i,"<C-f>","<C-c>ddi")

-- Save : Ctrl:S
set(n,"<C-s>","<cmd>w<cr>")
set(i, "<C-s>", "<C-o><cmd>w<cr>")

-- Misc
set(n, ";", ":")
set(n, "<Esc>", "<cmd>q<cr>")
set(n, "<S-`>", "<cmd>wq<cr>")

-- Packer
set(n, "<C-p>", "<cmd>PackerSync<cr>")
set(n, "<C-m>", "<cmd>Mason<cr>")

-- Telescope
local builtin = require('telescope.builtin')
set('n', '<leader>ff', builtin.find_files, {}) 
set('n', '<leader>fg', builtin.live_grep, {}) 
set('n', '<leader>fb', builtin.buffers, {})
set('n', '<leader>fh', builtin.help_tags, {})

-- Nvim Tree
set(n,"<c-e>","<C-c><cmd>Neotree toggle<cr>")
set(n,"<leader>e","<C-c><cmd>Neotree toggle<cr>")

--Window
set('n','<A-S-h>', '<C-w>h')
set('n','<A-S-j>', '<C-w>j')
set('n','<A-S-k>', '<C-w>k')
set('n','<A-S-l>', '<C-w>l')
