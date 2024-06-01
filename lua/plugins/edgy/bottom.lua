return {
  {
    ft = "toggleterm",
    size = { height = 0.4 },
    -- exclude floating windows
    filter = function(buf, win)
      return vim.api.nvim_win_get_config(win).relative == ""
    end,
  },
  {
    ft = "lazyterm",
    title = "LazyTerm",
    size = { height = 0.4 },
    filter = function(buf)
      return not vim.b[buf].lazyterm_cmd
    end,
  },
  "Trouble",
  { ft = "qf", title = "QuickFix" },
  {
    ft = "help",
    size = { height = 20 },
    -- only show help buffers
    filter = function(buf)
      return vim.bo[buf].buftype == "help"
    end,
  },
  { ft = "spectre_panel", size = { height = 0.4 } },
}
