if true then
  return {}
end
return {
  "krivahtoo/silicon.nvim",
  build = "./install.sh build",
  lazy = false,
  cmd = { "Silicon" },
  init = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>sc"] = { "<cmd>Silicon<cr>", "Snapshot Code" },
    }, { mode = "n" })
  end,
  config = function()
    require("silicon").setup({
      -- clipboard = true,
      font = "JetBrainsMono Nerd Font=21;Noto Color Emoji=16",
      theme = "Dracula",
      background = "#94e2d5",
      window_title = function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t") -- code
      end,
      -- theme = "Catppuccin-mocha"
    })
  end,
}
