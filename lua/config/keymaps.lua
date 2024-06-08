local map = vim.keymap.set
---@param description string
---@return table
local opts = function(description)
  return { noremap = true, silent = true, desc = description }
end
local Util = require("lazyvim.util")

map("x", "p", "P", opts("fix the stupid behaviour of neovim"))
map("x", "d", '"_d', opts("fix the stupid behaviour of neovim"))
map({ "n", "x" }, "dd", '"_dd', opts("fix the stupid behaviour of neovim"))
map("n", "<leader>j", "j^", opts("goto start of next line"))
map("n", "<leader>J", "j$", opts("goto end of next line"))
map("n", "<leader>k", "k^", opts("goto start of previous line"))
map("n", "<leader>K", "k$", opts("goto end of previous line"))
map("n", "<Esc>", ":q<CR>", opts("Close"))
map("i", "<A-f>", '<C-c>"_dd', opts("Delete Current Line"))
map("n", "<A-f>", '"_dd', opts("Delete Current Line"))
map({ "n", "i" }, "<A-d>", "<cmd>t .<CR>", opts("Copy Line Down"))
-- map("x", "<A-d>", "<cmd>'<,'>t .<CR>", opts("Copy Line Down"))
map("n", "<leader>i", "gg=G", opts("Indent Whole file"))
map("n", "<A-a>", 'ggvG"+y', opts("Select All and copy"))
-- map({ "n", "i" }, "<C-b>", "<PageDown>H0", opts("actual Page down"))
map("n", "<leader>ll", ":Lazy<CR>", opts("Open Lazy.nvim"))
map("n", "<leader>le", ":LazyExtras<CR>", opts("Open LazyVim Extras"))
map("n", "<leader>fN", ":Neotree toggle=true position=current<CR>", opts("Neotree Netrw Style"))
map("n", "<leader>sf", ":%s/original/updated", opts("Substite all in Current file"))
map("n", "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>", opts("Toggle UndoTree"))

map("n", "<leader>lg", function()
  Util.lazygit({ cwd = Util.root.git() })
end, { desc = "Lazygit (Root Dir)" })
map("n", "<leader>lG", function()
  Util.lazygit()
end, { desc = "Lazygit (cwd)" })
map("n", "<leader>lb", Util.lazygit.blame_line, { desc = "Git Blame Line" })
---@param keymaps string
---@param description string
---@return table
local wkopts = function(keymaps, description)
  return { keymaps, description, noremap = true, silent = true }
end
local wk = require("which-key")
wk.register({
  gd = {
    name = "Generate Docs",
    f = wkopts("<cmd>Neogen file<CR>", "Generate Doc for file"),
    c = wkopts("<cmd>Neogen class<CR>", "Generate Doc for class"),
    t = wkopts("<cmd>Neogen type<CR>", "Generate Doc for type"),
    n = wkopts("<cmd>Neogen func<CR>", "Generate Doc for function"),
  },
  --  uD= {
  --   name = "Database UI",
  --   e = wkopts("<cmd>DBUI<CR>", "Database Explorer"),
  --   a = wkopts("<cmd>DBUIAddConnection<CR>", "Add Database Connection"),
  -- },
}, { prefix = "<leader>" })

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
map("n", "<leader>ld", function()
  Util.terminal.open(
    { "lazydocker", "-f", Util.root.get() .. "docker-compose.yml" },
    { cwd = Util.root.get(), esc_esc = false }
  )
end, { desc = "LazyDocker (root dir)" })

map(
  "x",
  "<localleader>rr",
  "<Plug>RestNvim<cr>",
  opts("Run request under the cursor")
)
map(
  "x",
  "<localleader>rl",
  "<Plug>RestNvimLast<cr>",
  opts("Re-run latest request")
)
map('n', ',q', function()
  local pattern = _G._rest_nvim.env_pattern
  local command = string.format("fd -HI '%s'", pattern)
  local result = io.popen(command):read('*a')

  local env_list = {}
  for line in result:gmatch('[^\r\n]+') do
    table.insert(env_list, line)
  end

  local rest_functions = require('rest-nvim.functions')

  vim.ui.select(env_list, {
    prompt = 'Select env file ',
    format_item = function(item)
      return item
    end,
  }, function(choice)
      if choice == nil then
        return
      end
      rest_functions.env('set', choice)
    end)
end, { desc = '[q]uery envs' })
--- Example integration with Tabnine and LuaSnip; falling back to inserting tab if neither has a completion
-- vim.keymap.set("i", "<tab>", function()
--   if require("tabnine.keymaps").has_suggestion() then
--     return require("tabnine.keymaps").accept_suggestion()
--   elseif require("luasnip").jumpable(1) then
--     return require("luasnip").jump(1)
--   else
--     return "<tab>"
--   end
-- end, { expr = true })
