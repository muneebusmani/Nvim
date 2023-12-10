
local g = vim.g
local o = vim.o
local set = vim.keymap.set
local opts={silent=true, noremap=true}
local cmd=vim.cmd

local n = { "n" }
local i = { "i" }
local v = { "v" }
local vb = { "vb" }
local vl = { "vl" }

local s = { v,vb,vl }
local ni = { n, i }
local a = { n, i,vb,vl,v }

g.mapleader=" "
o.expandtab=true
o.tabstop=2
o.softtabstop=2
o.shiftwidth=2


set(n,"<leader>e",cmd.Ex)
set(n,"<leader>ff",":Telescope find_files<cr>")
set(n,"<leader>fg",":Telescope live_grep<cr>")

set(n,"<C-d>","VYp")
set(i,"<C-d>","<C-c>VYpi")

set(n,"<C-f>","dd")
set(i,"<C-f>","<C-c>ddi")

set(n,"<C-s>","<:w<cr>")
set(i, "<C-s>", "<C-o>:w<cr>")
