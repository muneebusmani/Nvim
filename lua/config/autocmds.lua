-- Autocmds are automatically loaded on the VeryLazy event
-- -- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local blade = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = blade,
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "php"
  end,
})

local compose = vim.api.nvim_create_augroup("compose_filetype", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = compose,
  pattern = { "docker-compose.yml", "compose.yml", "docker-compose.yaml", "compose.yaml" },
  callback = function()
    vim.bo.filetype = "yaml.docker-compose"
  end,
})

-- Additional autocommand to switch back to 'blade' after LSP has attached
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.blade.php",
  callback = function(args)
    vim.schedule(function()
      -- Check if the attached client is 'intelephense'
      for _, client in ipairs(vim.lsp.get_clients()) do
        if client.name == "phpactor" and client.attached_buffers[args.buf] then
          -- vim.api.nvim_buf_set_option(args.buf, "filetype", "blade")
          vim.api.nvim_set_option_value("filetype", "blade", { buf = args.buf })
          -- update treesitter parser to blade
          -- vim.api.nvim_buf_set_option(args.buf, "syntax", "blade")
          vim.api.nvim_set_option_value("syntax", "blade", { buf = args.buf })
          break
        end
      end
    end)
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.php",
  callback = function()
    vim.opt.iskeyword:append("$")
  end,
})

-- Create an autocommand to call the function on BufRead and BufEnter events
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = "*.blade.php",
--   callback = function(args)
--     local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
--     -- Iterate through the lines to check for the patterns
--     for _, line in ipairs(lines) do
--       if line:match("@%*%b()") or line:match("{{.*}}") then
--         vim.bo.filetype = "php"
--         return
--       else
--         vim.bo.filetype = "blade"
--         return
--       end
--     end
--   end,
-- })
